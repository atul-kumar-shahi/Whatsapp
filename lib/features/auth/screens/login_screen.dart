import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading:IconButton(
          icon:const Icon(Icons.arrow_back_ios_new),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Enter your phone number'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Text('WhatsApp will need to verify your phone number.',textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          TextButton(onPressed: (){}, child: Text('Pick country')),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 50),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText:'phone number'
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120.0),
            child: CustomButton(text: 'Next', onPressed: (){}),
          )
        ],
      ),
    );
  }
}
