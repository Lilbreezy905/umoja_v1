// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:umoja_v1/common/providers/message_reply_provider.dart';
import 'package:umoja_v1/common/utils/utils.dart';
import 'package:umoja_v1/features/chat/widget/emojie_widget.dart';
import 'package:umoja_v1/features/chat/widget/message_reply_preview.dart';

class BottomChatField extends ConsumerStatefulWidget {
  const BottomChatField({
    super.key,
    required this.receiverUserId,
    required this.isGroupChat,
  });
  final String receiverUserId;
  final bool isGroupChat;
  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  bool isShowing = false;
  bool isShowEmojiContainer = false;
  FocusNode focusNode = FocusNode();
  FlutterSoundRecorder? _flutterSoundRecorder;
  bool isRecorderInit = false;
  bool isRecoding = false;

  @override
  void initState() {
    super.initState();
    _flutterSoundRecorder = FlutterSoundRecorder();
    openAudio();
  }

  void openAudio() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Mic permission not allowed!');
    }
    await _flutterSoundRecorder!.openRecorder();
    isRecorderInit = true;
  }

  final TextEditingController messageController = TextEditingController();

  void sendTextMessage() async {
    if (isShowing) {
      messageController.text = '';
      setState(() {});
      setState(() {
        isShowEmojiContainer = false;
      });
    } else {
      var tempDir = await getTemporaryDirectory();
      var path = '${tempDir.path}/flutter_sound.aac';
      if (!isRecorderInit) {
        return;
      }
      if (isRecoding) {
        await _flutterSoundRecorder!.stopRecorder();
      } else {
        await _flutterSoundRecorder!.startRecorder(
          toFile: path,
        );
      }
      setState(() {
        isRecoding = !isRecoding;
      });
    }
  }

  void hideEmojieContainer() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void showEmojieContainer() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void showKeyBoard() => focusNode.requestFocus();
  void hideKeyBoard() => focusNode.unfocus();

  void toggleEmojieKeyboardContainer() {
    if (isShowEmojiContainer) {
      showKeyBoard();
      hideEmojieContainer();
    } else {
      hideKeyBoard();
      showEmojieContainer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
    _flutterSoundRecorder!.closeRecorder();
    isRecorderInit = false;
  }

  void selectImage() async {
    File? image = await pickImageFromGallery(context);
  }

  void selectVideo() async {
    File? video = await pickVideoFromGallery(context);
  }

  @override
  Widget build(BuildContext context) {
    final messageReply = ref.watch(messageReplyProvider);
    final isShowMessageReply = messageReply != null;
    final backgroundColor = Theme.of(context).colorScheme.background;
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    final iconColor = Theme.of(context).colorScheme.onBackground;
    return Column(
      children: [
        isShowMessageReply ? const MessageRepyPreview() : const SizedBox(),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                onTap: () {
                  setState(() {
                    isShowEmojiContainer = false;
                  });
                },
                maxLines: 3,
                minLines: 1,
                focusNode: focusNode,
                controller: messageController,
                onChanged: (val) {
                  if (val.isNotEmpty) {
                    setState(() {
                      isShowing = true;
                    });
                  } else {
                    setState(() {
                      isShowing = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintStyle: textStyle!.copyWith(fontSize: 20),
                  labelStyle: textStyle.copyWith(fontSize: 20),
                  prefixIconColor: iconColor,
                  suffixIconColor: iconColor,
                  filled: true,
                  fillColor: backgroundColor,
                  iconColor: iconColor,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.gif,
                                color: iconColor,
                              )),
                          IconButton(
                            onPressed: () async {
                              if (isShowEmojiContainer) {
                                setState(() {
                                  isShowEmojiContainer = false;
                                });
                                await Future.delayed(
                                        const Duration(milliseconds: 300))
                                    .then(
                                  (value) async {
                                    await SystemChannels.textInput
                                        .invokeMethod("TextInput.show");
                                  },
                                );
                              } else {
                                await SystemChannels.textInput
                                    .invokeMethod("TextInput.hide");
                                setState(() {
                                  isShowEmojiContainer = true;
                                });
                              }
                            },
                            icon: Icon(
                              isShowEmojiContainer
                                  ? Icons.keyboard
                                  : Icons.emoji_emotions,
                              color: iconColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return Container(
                              color: backgroundColor,
                              height: 150,
                              child: Container(
                                color: backgroundColor,
                                margin: const EdgeInsets.all(18),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 13),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: selectImage,
                                            child: CircleAvatar(
                                              backgroundColor: backgroundColor,
                                              radius: 30,
                                              child: Icon(
                                                Icons.image,
                                                color: iconColor,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "image",
                                            style: textStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      const SizedBox(width: 40),
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: selectVideo,
                                            child: CircleAvatar(
                                              backgroundColor: backgroundColor,
                                              radius: 30,
                                              child: Icon(
                                                Icons.videocam,
                                                color: iconColor,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "video",
                                            style: textStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Icon(
                      Icons.attach_file,
                      color: iconColor,
                    ),
                  ),
                  hintText: 'Message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
                right: 2,
                left: 2,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 20,
                child: GestureDetector(
                  onTap: sendTextMessage,
                  child: Icon(
                    isShowing
                        ? Icons.send
                        : isRecoding
                            ? Icons.close
                            : Icons.mic,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        isShowEmojiContainer
            ? SizedBox(
                height: 250,
                child: EmojisWidget(
                    addEmojiToTextController: addEmojiToTextController),
              )
            : const SizedBox()
      ],
    );
  }

  addEmojiToTextController({required Emoji emoji}) {
    setState(() {
      messageController.text = messageController.text + emoji.emoji;

      messageController.selection = TextSelection.fromPosition(
          TextPosition(offset: messageController.text.length));
      if (!isShowing) {
        setState(() {
          isShowing = true;
        });
      }
    });
  }
}

//methode pour ajouter des emojies

Widget emojiSelect() {
  return EmojiPicker(
    onEmojiSelected: (category, emoji) {
      // Do something when emoji is tapped (optional)
    },
    onBackspacePressed: () {
      // Do something when the user taps the backspace button (optional)
      // Set it to null to hide the Backspace-Button
    },
    config: Config(
      columns: 4,
      emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
      verticalSpacing: 0,
      horizontalSpacing: 0,

      noRecents: const Text(
        'No Recents',
        style: TextStyle(fontSize: 20, color: Colors.black26),
        textAlign: TextAlign.center,
      ), // Needs to be const Widget
      loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
      tabIndicatorAnimDuration: kTabScrollDuration,
      categoryIcons: const CategoryIcons(),
      buttonMode: ButtonMode.MATERIAL,
    ),
  );
}
