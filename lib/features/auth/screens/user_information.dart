import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/common/utils/utils.dart';
import 'package:whatsapp/features/auth/controller/auth_controller.dart';

class UserInformation extends ConsumerStatefulWidget {
  const UserInformation({super.key});

  static const String routeName = '/user-information';

  @override
  ConsumerState<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends ConsumerState<UserInformation> {
  final TextEditingController nameController = TextEditingController();
  File?image;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void pickImage() async {
    image=await pickImageFormGallery(context);
    setState(() {});
  }

  void storeUserData()async{
    String name=nameController.text.trim();
      if(name.isNotEmpty){
        ref.read(authControllerProvider).saveUserDataToFirebase(context, name, image);
      }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  image==null?const CircleAvatar(
                    radius: 64,
                    backgroundColor: backgroundColor,
                    backgroundImage: NetworkImage(
                        'https://static.vecteezy.com/system/resources/thumbnails/009/734/564/small/default-avatar-profile-icon-of-social-media-user-vector.jpg'),
                  ):CircleAvatar(
                    radius: 64,
                    backgroundColor: backgroundColor,
                    backgroundImage: FileImage(image!),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 70,
                    child: IconButton(
                      onPressed:pickImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.85,
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(hintText: 'Enter your name'),
                    ),
                  ),
                  IconButton(
                    onPressed: storeUserData,
                    icon: const Icon(Icons.check),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
