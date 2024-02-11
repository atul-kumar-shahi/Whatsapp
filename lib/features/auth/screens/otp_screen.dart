import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';

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
         title: const Text('Verifying your number'),
         elevation: 0,
         backgroundColor: backgroundColor,
          
       ),
     body: const Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         SizedBox(height: 40,),
         Text('we have sent an SMS with a code'),
         Padding(
           padding: EdgeInsets.symmetric(horizontal: 80.0),
           child: TextField(
             decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                )
             ),
           ),
         )
       ],
     ), 
    );
  }
}
