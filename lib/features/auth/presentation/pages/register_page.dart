import 'package:citychurch/features/auth/presentation/components/my_button.dart';
import 'package:citychurch/features/auth/presentation/components/my_textfield.dart';
import 'package:citychurch/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePage;

  const RegisterPage({super.key, required this.togglePage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controlers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();

  //register button  pressed
  void register() {
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String pw = pwController.text.trim();
    final String confirmPw = confirmPwController.text.trim();

    //auth cubit
    final authCubit = context.read<AuthCubit>();
    //ensure fields aren't empty
    if (email.isNotEmpty &&
        name.isNotEmpty &&
        pw.isNotEmpty &&
        confirmPw.isNotEmpty) {
      //ensure pw match
      if (pw == confirmPw) {
        authCubit.register(name, email, pw);
      }
      //pw doesn't match
      else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      }
    }
    //fields are empty -> display error
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please complete all fields")),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pwController.dispose();
    confirmPwController.dispose();
    super.dispose();
  }

  //BUILD UI
  @override
  Widget build(BuildContext context) {
    //SCAFFORD
    return Scaffold(
      //BODY
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //LOGO
              Icon(
                Icons.lock_open,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 25),
              //name of app
              Text(
                "Let's create account for you",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(height: 25),

              //email textfield
              MyTextfield(
                controller: nameController,
                hintText: "name",
                obscureText: false,
              ),

              const SizedBox(height: 25),

              //email textfield
              MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),

              const SizedBox(height: 10),
              //pw textfield
              MyTextfield(
                controller: pwController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 10),

              //Confirmpw textfield
              MyTextfield(
                controller: confirmPwController,
                hintText: "Confirm Password",
                obscureText: true,
              ),

              const SizedBox(height: 25),

              //register Button
              MyButton(
                onTap: register, 
                text: "Sign Up"
                ),

              const SizedBox(height: 25),
              //auth sign in later

              //dont have an account?register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.togglePage,
                    child: Text(
                      "Login now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
