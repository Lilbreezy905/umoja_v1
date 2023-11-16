// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  final String userName;
  final String uid;
  final String id;
  final List likes;
  final int commentCount;
  final int shareCount;
  final String songName;
  final String caption;
  final String videoUrl;
  final String thumbnail;
  final String profilePhoto;
  final List view;

  Video({
    required this.userName,
    required this.thumbnail,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.profilePhoto,
    required this.view,
  });

  // Map<String, dynamic> toJson() => {
  //       "username": userName,
  //       "uid": uid,
  //       "profilePhoto": profilePhoto,
  //       "id": id,
  //       "likes": likes,
  //       "commentCount": commentCount,
  //       "shareCount": shareCount,
  //       "songName": songName,
  //       "caption": caption,
  //       "videoUrl": videoUrl,
  //     };

  // static Video fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;

  //   return Video(
  //     userName: snapshot['userName'],
  //     uid: snapshot['uid'],
  //     id: snapshot['id'],
  //     likes: snapshot['likes'],
  //     commentCount: snapshot['commentCount'],
  //     shareCount: snapshot['shareCount'],
  //     songName: snapshot['songName'],
  //     caption: snapshot['caption'],
  //     videoUrl: snapshot['videoUrl'],
  //     profilePhoto: snapshot['profilePhoto'],
  //   );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'uid': uid,
      'id': id,
      'likes': likes,
      'commentCount': commentCount,
      'shareCount': shareCount,
      'songName': songName,
      'caption': caption,
      "thumbnail": thumbnail,
      'videoUrl': videoUrl,
      'profilePhoto': profilePhoto,
      "view": view,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
        userName: map['userName'] as String,
        uid: map['uid'] as String,
        id: map['id'] as String,
        likes: List.from((map['likes'] as List)),
        commentCount: map['commentCount'] as int,
        shareCount: map['shareCount'] as int,
        songName: map['songName'] as String,
        caption: map['caption'] as String,
        thumbnail: map['thumbnail'] as String,
        videoUrl: map['videoUrl'] as String,
        profilePhoto: map['profilePhoto'] as String,
        view: List.from((map['view'] as List)),);
  }
}
