import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/common/providers/message_reply_provider.dart';
import 'package:umoja_v1/features/chat/widget/display_text_image_gif.dart';

class MessageRepyPreview extends ConsumerWidget {
  const MessageRepyPreview({super.key});

  void cancelReply(WidgetRef ref) {
    // ignore: deprecated_member_use
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageReply = ref.watch(messageReplyProvider);
    return Container(
      width: 350,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  messageReply!.isMe ? "you" : "reply",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => cancelReply(ref),
                child: const Icon(
                  Icons.close,
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          DisplayTextImageGif(
              message: messageReply.message, type: messageReply.messageEnum),
        ],
      ),
    );
  }
}
