/*
login page
*/

import 'package:citychurch/features/auth/presentation/components/app_sign_in_button.dart';
import 'package:citychurch/features/auth/presentation/components/google_sign_button.dart';
import 'package:citychurch/features/auth/presentation/components/my_button.dart';
import 'package:citychurch/features/auth/presentation/components/my_textfield.dart';
import 'package:citychurch/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;

  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  //auth cubit
  late final authCubit = context.read<AuthCubit>();

  //login Button pressed
  void login() {
    final String email = emailController.text;
    final String pw = pwController.text;

    if (email.isNotEmpty && pw.isNotEmpty) {
      //login
      authCubit.login(email, pw);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("please enter both email & password")),
      );
    }
  }

  //forgot password box
  void openForgetPasswordBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Forgot Password"),
        content: MyTextfield(
          controller: emailController,
          hintText: "Enter email..",
          obscureText: false,
        ),
        actions: [
          //cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("cancel"),
          ),
          //reset button
          TextButton(
            onPressed: () async {
              String message = await authCubit.forgotPassword(
                emailController.text,
              );
              if (message == "password reset email sent! Check your inbox") {
                Navigator.pop(context);
                emailController.clear();
              }
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            child: const Text("Reset"),
          ),
        ],
      ),
    );
  }

  //BUILD UI
  @override
  Widget build(BuildContext context) {
    //SCAFFORD
    return Scaffold(
      //BODY
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                  "techTalk",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
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
                //forget pw
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => openForgetPasswordBox(),
                      child: Text(
                        "forgot password",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),
                //login Button
                MyButton(onTap: login, text: "Login"),

                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text("Or Sign in with"),
                    ),
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                //auth sign (apple + google)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //apple button
                    MyAppleSignInButton(),

                    const SizedBox(width: 20),

                    //google button
                    MyGoogleSignInButton(
                      onTap: () async {
                        authCubit.signInWithGoogle();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                //dont have an account?register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),

                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        "Register now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
