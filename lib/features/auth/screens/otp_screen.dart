import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key,required this.verificationId});

  static const String routeName='/otp-screen';
  final String verificationId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('otp screens'),
       ),
    );
  }
}
