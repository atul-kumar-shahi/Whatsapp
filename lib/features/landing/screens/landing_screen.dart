import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/common/widgets/custom_button.dart';
import 'package:whatsapp/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Welcome to whatsApp',
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height / 9,
            ),
            Image.asset(
              'assets/bg.png',
              color: tabColor,
              height: 340,
              width: 340,
            ),
            SizedBox(
              height: size.height / 9,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                style: TextStyle(color: greyColor),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width*0.75,
                child:CustomButton(text: 'AGREE TO CONTINUE', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(ctx)=>LoginScreen()));
                })),
          ],
        ),
      ),
    );
  }
}
