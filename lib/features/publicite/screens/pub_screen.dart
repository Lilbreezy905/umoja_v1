import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/features/chat/screens/mobile_chat_screen.dart';
import 'package:umoja_v1/features/publicite/screens/add_pub_screen.dart';
import 'package:umoja_v1/features/video/views/widget/portait_player_widget.dart';

class PubScreen extends ConsumerStatefulWidget {
  const PubScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PubScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends ConsumerState<PubScreen> {
  String downloadMessage = "downloading";
  bool isDownloading = false;
  // ignore: unused_field, prefer_final_fields
  var _progress = 0.0;

  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        Positioned(
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget postedPub({
    required String userName,
    required String userUid,
    required String proflePhoto,
    required DateTime datePublished,
    required String postUrl,
    required String caption,
    required String postId,
    required String pubType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/U1.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userName),
                          Text("hour"),
                        ],
                      ),
                    ],
                  ),
                  PopupMenuButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, MobileChatScreen.routeName,
                                    arguments: {
                                      'name': userName,
                                      'uid': userUid,
                                      'isGroupChat': false,
                                      'profilePic': proflePhoto,
                                    });
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.chat),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("Message"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              children: [
                                Icon(Icons.info),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("report"),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(caption)
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: pubType == 'image'
                  ? CachedNetworkImage(fit: BoxFit.contain, imageUrl: postUrl)
                  : PortraitPlayerWidget(
                      url: postUrl,
                      id: "uudud",
                    ),
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgrounndTheme = Theme.of(context).colorScheme.background;
    final textColor = Theme.of(context).textTheme.bodyMedium;
    // final iconColor = Theme.of(context).colorScheme.onBackground;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgrounndTheme,
        elevation: 0.3,
        centerTitle: false,
        title: Text(
          "Adverstement",
          style: textColor!.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddPubScreen())),
              child: Text(
                "add ads here",
                style: textColor.copyWith(fontSize: 15),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        

                        return postedPub(
                            caption: "pub",
                            datePublished:DateTime.now(),
                            postId: "data.postId",
                            postUrl: "data.postUrl",
                            proflePhoto: "assets/U1.png",
                            pubType: "image",
                            userName: "Brice",
                            userUid:" data.userUid");
                      })
              
           
          ),
        );
     
  }
}
