import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => _auth.authStateChanges();

// ! function for signing in with email and password
  Future<void> signinWithEmail(
      String email, String password, BuildContext context) async {
    ThemeData theme = Theme.of(context);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  "Error occured",
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: Colors.red.shade500),
                ),
                content: Text(
                  e.toString(),
                  style: theme.textTheme.bodyMedium,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"))
                ],
              ));
    }
  }
  // !sign up the user using email and password

  Future<void> signupWithEmail(
      String email, String password, BuildContext context) async {
    ThemeData theme = Theme.of(context);
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  "Error occurred",
                  style: theme.textTheme.bodyLarge!.copyWith(color: Colors.red),
                ),
                content: Text(
                  e.toString(),
                  style: theme.textTheme.bodyMedium,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"))
                ],
              ));
    } catch (e) {
      if (e == 'email-already-in-use') {
        const Text("Email already in use");
      } else {
        Text(e.toString());
      }
    }
  }
  // ! sign in with google

  Future<void> signinWithGoogle(BuildContext context) async {
    ThemeData theme = Theme.of(context);
    // Trigger auth flow
    final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

    // auth details
    final GoogleSignInAuthentication googleAuth =
        await googleuser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  "Error Occurred",
                  style: theme.textTheme.bodyLarge!.copyWith(color: Colors.red),
                ),
                content: Text(
                  e.toString(),
                  style: theme.textTheme.bodyMedium,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"))
                ],
              ));
    }
  }

  // ! signout user
  Future<void> signoutUser() async {
    await _auth.signOut();
  }
}
