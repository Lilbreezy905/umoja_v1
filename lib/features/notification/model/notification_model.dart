class NotificationModel {
  final String senderName;
  final String receiverName;
  final String receiverUid;
  final String notificationContent;
  final String senderProfilePic;
  final String senderUid;
  final String notificationType;
  final DateTime datePublished;
  NotificationModel({
    required this.senderName,
    required this.receiverName,
    required this.receiverUid,
    required this.notificationContent,
    required this.senderProfilePic,
    required this.senderUid,
    required this.notificationType,
    required this.datePublished,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderName': senderName,
      'receiverName': receiverName,
      'receiverUid': receiverUid,
      'notificationContent': notificationContent,
      'senderProfilePic': senderProfilePic,
      "senderUid":senderUid,
      "notificationType":notificationType,
      'datePublished': datePublished.millisecondsSinceEpoch,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      senderName: map['senderName'] as String,
      receiverName: map['receiverName'] as String,
      receiverUid: map['receiverUid'] as String,
      notificationContent: map['notificationContent'] as String,
      senderProfilePic: map['senderProfilePic'] as String,
      senderUid: map['senderUid'] as String,
      notificationType: map['notificationType'] as String,
      datePublished:
          DateTime.fromMillisecondsSinceEpoch(map['datePublished'] as int),
    );
  }
}
