import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/common/utils/utils.dart';
import 'package:whatsapp/common/widgets/custom_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:whatsapp/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login-screen';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneNumberController = TextEditingController();
  Country?country;

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }
  void pickCountry(){
    showCountryPicker(context: context, onSelect: (Country _country){
      setState(() {
        country=_country;
      });
    });
  }

  void sendPhoneNumber(){
    String phoneNumber=phoneNumberController.text.trim();
    AuthController? authController = ref.read(authControllerProvider);
    if(authController!=null&& country!=null&&phoneNumber.isNotEmpty){
      print('calling signinwithphone');
      ref.read(authControllerProvider).signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    }
    else{
      showSnackBar(context: context, content: 'Fill all the required details');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Enter your phone number'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'WhatsApp will need to verify your phone number.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    pickCountry();
                  },
                  child: const Text('Pick country'),),
              Row(
                children: [
                  if(country!=null)
                  Text('+${country!.phoneCode}'),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: 'phone number'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.585,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 110.0),
                child: CustomButton(
                    text: 'Next',
                    onPressed: () {
                     sendPhoneNumber();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
