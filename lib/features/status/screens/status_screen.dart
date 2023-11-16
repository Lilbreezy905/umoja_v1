// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:umoja_v1/common/widget/loader.dart';

import '../../../models/status_model.dart';

class StatusScreen extends StatefulWidget {
  static const String routeName = "/status-screen";
  final Status status;

  const StatusScreen({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<StoryItem> storyItem = [];
  StoryController storyController = StoryController();
  @override
  void initState() {
    super.initState();
    initStoryPageItems();
  }

  void initStoryPageItems() {
    
      storyItem.add(
        StoryItem.pageImage(
            url: "assets/U1.png", controller: storyController),
      );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: storyItem.isEmpty
          ? const Loader()
          : StoryView(
              storyItems: storyItem,
              controller: storyController,
              onVerticalSwipeComplete: (direction) {
                if (direction == Direction.down) {
                  Navigator.pop(context);
                }
              },
            ),
    );
  }
}
