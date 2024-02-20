import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/select_contacts/repository/select_contact_repository.dart';

final getContactsProvider=FutureProvider((ref){
  final selectContactsRepository=ref.watch(selectContactsRepositoryProvider);
  return selectContactsRepository.getContacts();
});