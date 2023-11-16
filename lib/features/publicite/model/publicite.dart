
// ignore_for_file: public_member_api_docs, sort_constructors_first
class Publicite {
   final String userName;
   final String userUid;
   final String proflePhoto;
   final DateTime datePublished;
   final String postUrl;
   final String caption;
   final String postId;
   final String pubType;
  Publicite({
    required this.userName,
    required this.userUid,
    required this.proflePhoto,
    required this.postUrl,
    required this.datePublished,
    required this.caption,
    required this.postId,
    required this.pubType,
  });




  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'userUid': userUid,
      'proflePhoto': proflePhoto,
      'datePublished': datePublished.millisecondsSinceEpoch,
      'postUrl': postUrl,
      'caption': caption,
      'postId': postId,
      'pubType': pubType,
    };
  }

  factory Publicite.fromMap(Map<String, dynamic> map) {
    return Publicite(
      userName: map['userName'] as String,
      userUid: map['userUid'] as String,
      proflePhoto: map['proflePhoto'] as String,
      datePublished: DateTime.fromMillisecondsSinceEpoch(map['datePublished'] as int),
      postUrl: map['postUrl'] as String,
      caption: map['caption'] as String,
      postId: map['postId'] as String,
      pubType: map['pubType'] as String,
    );
  }


}
