// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String userName;
  String comment;
  // ignore: prefer_typing_uninitialized_variables
   final  datePublished;
  List likes;
  String profilePhoto;
  String uid;
  String id;

  Comment({
    required this.userName,
    required this.comment,
    required this.datePublished,
    required this.likes,
    required this.profilePhoto,
    required this.uid,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        'username': userName,
        'comment': comment,
        'datePublished': datePublished,
        'likes': likes,
        'profilePhoto': profilePhoto,
        'uid': uid,
        'id': id,
      };

  static Comment fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Comment(
      userName: snapshot['username'],
      comment: snapshot['comment'],
      datePublished: snapshot['datePublished'],
      likes: snapshot['likes'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      id: snapshot['id'],
    );
  }

  



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'comment': comment,
      'datePublished': datePublished.millisecondsSinceEpoch,
      'likes': likes,
      'profilePhoto': profilePhoto,
      'uid': uid,
      'id': id,
    };
  }

  

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      userName: map['userName'] as String,
      comment: map['comment'] as String,
      datePublished: DateTime.fromMillisecondsSinceEpoch(map['datePublished'] as int),
      likes: List.from((map['likes'] as List)),
      profilePhoto: map['profilePhoto'] as String,
      uid: map['uid'] as String,
      id: map['id'] as String,
    );
  }

  }
