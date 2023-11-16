import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:umoja_v1/features/user_profile/screens/widget/panel_widget.dart';
import 'package:umoja_v1/models/user_model.dart';

class UserProfile extends ConsumerStatefulWidget {
  const UserProfile({super.key});
  

  @override
  ConsumerState<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfile> {
  List<UserModel> userModel= [];
  
  @override
  Widget build(BuildContext context) {
    userModel.add(UserModel(name: "Jochim", uid: "uid", profilePic: "https://www.istockphoto.com/photo/abstract-blue-splashes-and-black-background-gm1463973381-496805567?utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Ffr%2Fs%2Fphotos%2Fsplash&utm_medium=affiliate&utm_source=unsplash&utm_term=splash%3A%3A%3A", isOnline: false, phoneNumber: "+257 67555334", groupId: []));
    final backgroundColor = Theme.of(context).colorScheme.background;
    final iconColor = Theme.of(context).colorScheme.onBackground;
    final panelController = PanelController();
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon:  Icon(Icons.person_outline,color: iconColor,),
          onPressed: () {},
        ),
      ),
      body:
            SlidingUpPanel(
              maxHeight: 340,
              minHeight: 150,
              parallaxEnabled: true,
              parallaxOffset: 0.5,
              body: PageView(
                children: [
                  CachedNetworkImage(
                    imageUrl: "https://www.istockphoto.com/search/2/image?utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Ffr%2Fs%2Fphotos%2Fsplash&utm_medium=affiliate&utm_source=unsplash&utm_term=splash%3A%3A%3A&alloweduse=availableforalluses&excludenudity=true&mediatype=photography&phrase=splash&sort=best",
                    fit: BoxFit.cover,
                  )
                ],
              ),
              panelBuilder: (ScrollController scrollController) => PanelWidget(
                user: userModel[0],
                onClickedPanel: panelController.open,
               
              ),
            )
         
    );
  }
}
