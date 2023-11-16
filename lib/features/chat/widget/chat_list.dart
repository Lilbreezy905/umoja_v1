import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/common/providers/message_reply_provider.dart';
import 'package:umoja_v1/enums/message_enum.dart';
import 'package:umoja_v1/features/chat/widget/sender_message_card.dart';

import 'my_message_card.dart';

class ChatList extends ConsumerStatefulWidget {
  final String receiverUserId;
  final bool isGroupChat;
  const ChatList(
      {Key? key, required this.receiverUserId, required this.isGroupChat})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void onMessageSwipe(
    String message,
    bool isMe,
    MessageEnum messageEnum,
  ) {
    // ignore: deprecated_member_use
    ref.read(messageReplyProvider.state).update(
          (state) => Messagereply(
            message,
            isMe,
            messageEnum,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
   
          return ListView.builder(
            
            itemCount: 2,
            itemBuilder: (context, index) {

              return Column(
                children: [
                  
             MyMessageCard(
                  message:" Bonjour",
                  date: "17h00",
                  type:MessageEnum.text,
                  replyText: "messageData.repliedMessage",
                  userName: "user Name",
                  repliedMessageType: MessageEnum.text,
                  onLeftSwipe: () =>
                      onMessageSwipe("messageData  text", true, MessageEnum.text),
                  isSeen: false,
                ),
              
               SenderMessageCard(
                 message:" Bonjour",
                  date: "17h00",
                  type:MessageEnum.text,
                  replyText: "messageData  repliedMessage",
                  userName: "user Name",
                  repliedMessageType: MessageEnum.text,
                onRightSwipe: () => onMessageSwipe(
                  "messageData text",
                  false,
                  MessageEnum.text,
                ),
              )
                ],
              );
             
            },
          );
       
  }
}

