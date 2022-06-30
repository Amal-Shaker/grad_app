import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String getUserId() {
    return firebaseAuth.currentUser!.uid;
  }

  Future<UserCredential> signup(String? email, String? password) async {
    // try {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email!, password: password!);
    print("frommmm auth helper${userCredential.user!.uid}");
    return userCredential;
    // } catch (e) {
    //   print('e');
    // }
    //  on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     showDialog(
    //         context: context,
    //         builder: (BuildContext context) {
    //           return CustomDalogIncorrectSend();
    //         });
    //    // return null;
    //   } else if (e.code == 'email-already-in-use') {
    //     showDialog(
    //         context: context,
    //         builder: (BuildContext context) {
    //           return CustomDalogIncorrectSend();
    //         });
    //   }
    // }
  }

  Future<String?> signin(String email, String password) async {
    // UserCredential userCredential = await firebaseAuth
    //     .signInWithEmailAndPassword(email: email, password: password);
    // print(await userCredential.user.getIdToken());
    // print(userCredential.user.uid);

    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return null;
      }
    }
  }

  resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    // CustomDialoug.customDialoug.showCustomDialoug(
    //     'we have sent email for reset password, please check your email');
  }
}

// ignore: non_constant_identifier_names
class CustomDalogIncorrectSend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        child: Column(
          children: [
            Center(child: Text('Invaild value')),
            Center(
              child: Text('Please put value greater than 0'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('ok'))
          ],
        ),
      ),
    );
  }
}
