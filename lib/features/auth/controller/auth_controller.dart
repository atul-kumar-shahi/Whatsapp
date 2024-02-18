import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/auth/repository/auth_repository.dart';

final authControllerProvider=Provider((ref){
  final authRepository=ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository,ref: ref);
});

class AuthController{
  const AuthController({required this.authRepository,required this.ref});

  final AuthRepository authRepository;
  final ProviderRef ref;

  void signInWithPhone(BuildContext context,String phoneNumber){
      authRepository.signInWithPhone(context, phoneNumber);
  }
  void verifyOtp(BuildContext context,String verificationId,String userOtp){
      authRepository.verifyOtp(context: context, verificationId: verificationId, userOtp: userOtp);
  }
  void saveUserDataToFirebase(BuildContext context,String name,File?profileImage){
    authRepository.saveInformationToFirestore(name: name, profileImage: profileImage, ref: ref, context: context);

  }

}