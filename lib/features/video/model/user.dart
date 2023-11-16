// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profilePic;
  bool isOnline;
  String uid;

  User({
    required this.name,
    required this.profilePic,
    required this.isOnline,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePic": profilePic,
        "uid": uid,
        "isOnline": isOnline,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        profilePic: snapshot['profilePic'],
        uid: snapshot['uid'],
        name: snapshot['name'],
        isOnline: snapshot['isOnline']);
  }
}
