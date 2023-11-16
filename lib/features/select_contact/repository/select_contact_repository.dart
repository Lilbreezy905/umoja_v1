// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/common/utils/utils.dart';
import 'package:umoja_v1/features/chat/screens/mobile_chat_screen.dart';

import '../../../models/user_model.dart';

final selectContactsRepositoryProvider = Provider(
  (ref) => SelectContactRepository(
    firestore: FirebaseFirestore.instance,
  ),
);

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository({
    required this.firestore,
  });

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  void selectContact(Contact selectedContact, BuildContext context) async {
    try {
      // recuperation du collection des utilisateurs dans firestore
      var usersCollection = await firestore.collection("users").get();
      bool isFound = false;

      for (var document in usersCollection.docs) {
        var usersData = UserModel.fromMap(document.data());
        String selectedPhoneNumber =
            selectedContact.phones[0].number.replaceAll(' ', '');
        if (selectedPhoneNumber == usersData.phoneNumber) {
          isFound = true;
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, MobileChatScreen.routeName, arguments: {
            'name': usersData.name,
            'uid': usersData.uid,
            'isGroupChat': false,
            'profilePic': usersData.profilePic,
          });
        }
      }
      if (!isFound) {
        // ignore: use_build_context_synchronously
        showSnackBar(
            context: context, content: "this number doesn't exist in this app");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context: context, content: e.toString());
    }
  }
}
