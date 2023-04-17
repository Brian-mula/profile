import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payroll/models/usersModel.dart';
import 'package:payroll/providers/users_provider.dart';

class Authentication {
  final Ref ref;
  Authentication(this.ref);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool nexpage = false;

  Stream<User?> get authStateChange => _auth.authStateChanges();

// ! function for signing in with email and password
  Future<void> signinWithEmail(
      String email, String password, BuildContext context) async {
    ThemeData theme = Theme.of(context);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      nexpage = true;
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

  Future<void> signupWithEmail(String email, String password, String username,
      BuildContext context) async {
    ThemeData theme = Theme.of(context);

    final users = ref.watch(usersProvider);
    try {
      UsersModel usersModel = UsersModel(email, username);
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await users.addUser(usersModel);

      nexpage = true;
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
      nexpage = true;
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
    nexpage = false;
  }
}
