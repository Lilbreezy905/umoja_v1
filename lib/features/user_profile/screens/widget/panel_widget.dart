import 'package:flutter/material.dart';
import 'package:umoja_v1/features/user_profile/screens/widget/panel_header_widget.dart';
import 'package:umoja_v1/models/user_model.dart';

class PanelWidget extends StatelessWidget {
  const PanelWidget(
      {super.key,
      required this.user,
      required this.onClickedPanel,});
  final UserModel user;
  final VoidCallback onClickedPanel;

  @override
  Widget build(BuildContext context) => Column(
        children: [
         
          Expanded(
            child: Container(
             
              decoration:  BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: buildProfile(context),
            ),
          ),
        ],
      );

  Widget buildProfile(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onClickedPanel,
        child: Container(
          color: Theme.of(context).colorScheme.background,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              PanelHeaderWidget(
                user: user,
              ),
              const SizedBox(height: 24),
              // Expanded(child: buildProfileDetails(user, context)),
            ],
          ),
        ),
      );

  Widget buildProfileDetails(UserModel user, BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 12),
          Text(
            "user.phoneNumber,",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 12),
          // Expanded(
          //   child: ListView(scrollDirection: Axis.horizontal, children: [
          //     Container(
          //       height: 100,
          //       width: 100,
          //       padding: EdgeInsets.only(right: 5),
          //       child: Image.network(user.profilePic, fit: BoxFit.cover),
          //     )
          //   ]),
          // )
        ],
      );
}
