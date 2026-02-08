/*
FIREBASE IS OUR BACKEND - swap any backend here
*/ 

import 'package:citychurch/features/auth/domain/entities/app_user.dart';
import 'package:citychurch/features/auth/domain/repos/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo implements AuthRepo {
  //access to firebase
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//Delete account
@override
  Future<void> deleteAccount() async {
    try {
      final user = firebaseAuth.currentUser;

      //check if there is a logged in user
      if (user == null) throw Exception("No user logged in..");
      //delete account
      await user.delete();

      await logout();
    } catch (e) {
      throw Exception("Failed to delete account");
    }
  }

  //Get Current User
  @override
  Future<AppUser?> getCurrentUser() async {
    //Get current logged in user from firebase

    final firebaseUser = firebaseAuth.currentUser;
    //no logged in user
    if (firebaseUser == null) return null;
    //logged user exits
    return AppUser(uid: firebaseUser.uid, email: firebaseUser.email!);
  }

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      //Attempt sign in
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      //create user
      AppUser user = AppUser(uid: userCredential.user!.uid, email: email);
      //return user
      return user;
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }

  //LOGOUT
  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }



  //REGISTER: Email & Password
  @override
  Future<AppUser?> registerWithEmailPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      //attempt sign up
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      //create user

      AppUser user = AppUser(uid: userCredential.user!.uid, email: email);

      //return user
      return user;
    } catch (e) {
      throw Exception("Registration failed: $e");
    }
  }

  //RESET PASSWORD
  @override
  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return "password reset email sent! Check your inbox";
    } catch (e) {
      return "An error occured: $e";
    }
  }

  @override
  Future<AppUser?> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  //Google SignIn
@override
  Future<AppUser?> signInWithGoogle() async {
    try {
      final googleProvider = GoogleAuthProvider();

      final UserCredential userCredential = await firebaseAuth
          .signInWithProvider(googleProvider);

      final user = userCredential.user;
      if (user == null) return null;

      return AppUser(uid: user.uid, email: user.email ?? '');
    } catch (e) {
      throw Exception('Google sign-in failed: $e');
    }
  }
  
}