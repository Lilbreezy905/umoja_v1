// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotificationCountModel {
  final String countFor;
  final int userNotificationCount;
  NotificationCountModel({
    required this.countFor,
    required this.userNotificationCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'countFor': countFor,
      'userNotificationCount': userNotificationCount,
    };
  }

  factory NotificationCountModel.fromMap(Map<String, dynamic> map) {
    return NotificationCountModel(
      countFor: map['countFor'] as String,
      userNotificationCount: map['userNotificationCount'] as int,
    );
  }
}
