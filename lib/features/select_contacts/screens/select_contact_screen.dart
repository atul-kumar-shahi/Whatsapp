import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/common/widgets/error.dart';
import 'package:whatsapp/common/widgets/loader.dart';
import 'package:whatsapp/features/select_contacts/controller/select_contacts_controller.dart';

class SelectContactScreen extends ConsumerWidget {
  const SelectContactScreen({super.key});

  static const String routeName = '/select-contact';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select contact'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ref.watch(getContactsProvider).when(
          data: (contactList) => ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (ctx, index) {
                  final contact = contactList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      title: Text(contact.displayName,style: TextStyle(fontSize: 18),),
                      leading: contact.photo == null
                          ? const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://static.vecteezy.com/system/resources/thumbnails/009/734/564/small/default-avatar-profile-icon-of-social-media-user-vector.jpg'),
                              radius: 25,
                            )
                          : CircleAvatar(
                              backgroundImage: MemoryImage(contact.photo!),
                              radius: 30,
                            ),
                    ),
                  );
                },
              ),
          error: (err, trace) => ErrorScreen(error: err.toString()),
          loading: () => const CustomLoader()),
    );
  }
}
