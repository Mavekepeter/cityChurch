import 'package:citychurch/features/auth/data/fire_auth_repo.dart';
import 'package:citychurch/features/auth/presentation/components/loading.dart';
import 'package:citychurch/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:citychurch/features/auth/presentation/cubits/auth_state.dart';
import 'package:citychurch/features/auth/presentation/pages/auth_page.dart';
import 'package:citychurch/features/home/presentation/pages/home_page.dart';
import 'package:citychurch/firebase_options.dart';
import 'package:citychurch/themes/dark_mode.dart';
import 'package:citychurch/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //run app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //auth repo
  final firebaseAuthRepo = FirebaseAuthRepo();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //provide cubits to app
      providers: [
        //auth cubit
        BlocProvider<AuthCubit>(
          create: (context) =>
              AuthCubit(authRepo: firebaseAuthRepo)..checkAuth(),
        ),
      ],

      //app
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        darkTheme: darkMode,

        /*
      Bloc consumer -Auth
      */
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state) {
            print(state);
            //unauthenticated -> auth page
            if (state is Unauthenticated) {
              return const AuthPage();
            }
            //authenticated ->home page
            if (state is Authenticated) {
              return const HomePage();
            }
            // loading..
            else {
              return const LoadingScreen();
            }
          },

          //listen for state changes
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
      ),
    );
  }
}
