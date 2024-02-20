import 'package:flutter/material.dart';
import 'package:whatsapp/common/widgets/error.dart';
import 'package:whatsapp/features/auth/screens/login_screen.dart';
import 'package:whatsapp/features/auth/screens/otp_screen.dart';
import 'package:whatsapp/features/auth/screens/user_information.dart';
import 'package:whatsapp/features/select_contacts/screens/select_contact_screen.dart';

Route<dynamic>generateRoutes(RouteSettings settings){
  switch(settings.name){

    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context)=>const LoginScreen());
    case UserInformation.routeName:
      return MaterialPageRoute(builder: (context)=>const UserInformation());
    case SelectContactScreen.routeName:
      return MaterialPageRoute(builder: (context)=>const SelectContactScreen());
    case OtpScreen.routeName:
      final verificationId=settings.arguments.toString();
      return MaterialPageRoute(builder: (context)=>OtpScreen(verificationId:verificationId));

    default:
      return MaterialPageRoute(builder: (context)=>const Scaffold(
       body: ErrorScreen(error: 'This page does not exist',),
  ),);
  }
}