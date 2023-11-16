

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/enums/message_enum.dart';


class Messagereply {
  
  final String message;
  final bool isMe;
  final MessageEnum messageEnum;
  Messagereply(this.message,this.isMe,this.messageEnum);
  
}
final messageReplyProvider = StateProvider<Messagereply?>((ref) => null);