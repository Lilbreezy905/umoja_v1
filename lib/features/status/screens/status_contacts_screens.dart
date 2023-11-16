import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/features/status/screens/status_screen.dart';
import 'package:umoja_v1/models/status_model.dart';

class StatusContactScreens extends ConsumerWidget {
  const StatusContactScreens({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              Status? status;
          final textStyle  = Theme.of(context).textTheme.bodyMedium!.copyWith(
               fontSize: 18
          );
          final iconColor = Theme.of(context).colorScheme.onBackground;

              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, StatusScreen.routeName,
                          arguments: status);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        title: Text(
                          "user name",
                          style: textStyle,
                        ),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/U1.png"),
                          radius: 30,
                        ),
                      ),
                    ),
                  ),
                   Divider(color: iconColor, indent: 85),
                ],
              );
            },
          );
  }
}
