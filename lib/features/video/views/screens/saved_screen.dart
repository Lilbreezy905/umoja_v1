import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:umoja_v1/common/widget/loader.dart';
import 'package:umoja_v1/features/video/views/widget/portait_player_widget.dart';

class SavedVideo extends ConsumerStatefulWidget {
  const SavedVideo({super.key, required this.index});
  
  final double index;
  @override
  ConsumerState<SavedVideo> createState() => _SavedVideo();
}

class _SavedVideo extends ConsumerState<SavedVideo> {
  final itemController = ItemScrollController();
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) =>scrollToIndex(widget.index));
  }

  // void scrollToIndex(int index)=>itemController.jumpTo(index: index,);
  Widget postedVideo({
    required String id,
    required String uid,
    required String userName,
    required String profilePic,
    required List likeCount,
    required int commentCount,
    required String videoUrl,
    required String caption,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
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
                        backgroundImage: CachedNetworkImageProvider(profilePic),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userName,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                          ),),
                         
                        ],
                      ),
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
                    width: 20,
                  ),
                  Text(caption)
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              color: Colors.grey,
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: PortraitPlayerWidget(url: videoUrl,id: id,),
            ),
             Divider(thickness: 1,color: Theme.of(context).colorScheme.onBackground,),
             SizedBox(height: 5,)
           
          ],
        ),
      ),
    );
  }

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream:null,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loader();
                  }
                  
                  return ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      

                      return postedVideo(
                        id: "data.id",
                        uid: "uid",
                        userName: "userName",
                        profilePic: "data profilePhoto",
                        likeCount:[],
                        commentCount: 5,
                        caption: "data.caption",
                        videoUrl: "data.videoUrl",
                        context: context,
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
