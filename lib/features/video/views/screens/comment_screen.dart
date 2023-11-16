import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class CommentScreen extends ConsumerStatefulWidget {
  final String id;
  const CommentScreen({super.key, required this.id});

  @override
  ConsumerState<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends ConsumerState<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();

  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final backgroundColor = Theme.of(context).colorScheme.background;
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    final iconColor = Theme.of(context).colorScheme.onBackground;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.height,
            height: size.height,
            child: Column(
              children: [
                Expanded(
                  child: Obx(() {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      scrollController
                          .jumpTo(scrollController.position.maxScrollExtent);
                    });
                    return ListView.builder(
                      controller: scrollController,
                      itemCount: 1,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: CachedNetworkImageProvider(
                                "https://www.istockphoto.com/search/2/image?utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Ffr%2Fs%2Fphotos%2Fsplash&utm_medium=affiliate&utm_source=unsplash&utm_term=splash%3A%3A%3A&alloweduse=availableforalluses&excludenudity=true&mediatype=photography&phrase=splash&sort=best"),
                          ),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " userName ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "comment",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "3h ago",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '12 likes',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          trailing: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.favorite,
                              size: 25,
                              color: iconColor,
                            ),
                          ),
                        );
                      }),
                    );
                  }),
                ),
                const Divider(),
                ListTile(
                  title: TextFormField(
                    controller: _commentController,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Comment',
                      labelStyle: textStyle!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: iconColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: iconColor),
                      ),
                    ),
                  ),
                  trailing: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Send',
                      style: textStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
