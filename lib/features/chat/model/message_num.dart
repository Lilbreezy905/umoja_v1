// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageNum {
  final String countFor;
  final int msgNum;
  MessageNum({
    required this.countFor,
    required this.msgNum,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'countFor': countFor,
      'msgNum': msgNum,
    };
  }

  factory MessageNum.fromMap(Map<String, dynamic> map) {
    return MessageNum(
      countFor: map['countFor'] as String,
      msgNum: map['msgNum'] as int,
    );
  }

 
}
