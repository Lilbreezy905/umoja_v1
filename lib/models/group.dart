

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Group {
 final String senderId; 
 final String name;
 final String groupId;
 final String lastMessage;
 final  String  groupPic;
 final int messageNum;
 final DateTime timeSent;
 final List<String> membersUid;
  Group({
    required this.senderId,
    required this.name,
    required this.groupId,
    required this.lastMessage,
    required this.groupPic,
    required this.messageNum,
    required this.timeSent,
    required this.membersUid,
  });
 

 


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'name': name,
      'groupId': groupId,
      'lastMessage': lastMessage,
      "messageNum":messageNum,
      'groupPic': groupPic,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'membersUid': membersUid,
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      senderId: map['senderId'] as String,
      name: map['name'] as String,
      groupId: map['groupId'] as String,
      lastMessage: map['lastMessage'] as String,
      messageNum: map['messageNum'] as int,
      groupPic: map['groupPic'] as String,
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent'] as int),
      membersUid: List<String>.from((map['membersUid']),
    ));
  }


  }
