import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/common/utils/utils.dart';
import 'package:whatsapp/features/auth/screens/otp_screen.dart';

final authRepositoryProvider=Provider(
    (ref){
        return AuthRepository(auth: FirebaseAuth.instance,firestore: FirebaseFirestore.instance);
    }
);

class AuthRepository {
  const AuthRepository({required this.auth, required this.firestore});

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            throw Exception(e.message);
          },
          codeSent: ((String verificationId, int? resendToken) async {
            print('navigation to otp screen');
            Navigator.pushNamed(context, OtpScreen.routeName,arguments:verificationId);
          }),
          codeAutoRetrievalTimeout: (String verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
