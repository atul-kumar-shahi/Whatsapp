import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/features/auth/controller/auth_controller.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key,required this.verificationId});

  static const String routeName='/otp-screen';
  final String verificationId;

  void verifyOtp(WidgetRef ref,BuildContext context, String userOtp){
    ref.read(authControllerProvider).verifyOtp(context, verificationId, userOtp);
  }


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
         title: const Text('Verifying your number'),
         elevation: 0,
         backgroundColor: backgroundColor,

       ),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         const SizedBox(height: 40,),
         const Text('we have sent an SMS with a code'),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 80.0),
           child: SizedBox(
             width: size.width*0.5,
             child: TextField(
               textAlign: TextAlign.center,
               decoration: InputDecoration(
                 hintText: '- - - - - -',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    wordSpacing: 2,

                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  )
               ),
               keyboardType: TextInputType.number,
               onChanged: (val){
                 if(val.length==6){
                   verifyOtp(ref, context,val.trim() );
                 }
               },
             ),
           ),
         )
       ],
     ),
    );
  }
}
