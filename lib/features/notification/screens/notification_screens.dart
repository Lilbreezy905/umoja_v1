// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreen();
}

class _NotificationScreen extends ConsumerState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.background;
    final textstyle = Theme.of(context).textTheme.bodyMedium;
    final iconColor = Theme.of(context).colorScheme.onBackground;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: 
          Container(
            color: backgroundColor,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                     "assets/U1.png"
                    ),
                  ),
                  title: Row(
                    children: [
                      Text("senderName"),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Notification content"),
                    ],
                  ),
                  subtitle:  Text("17h00"),
                );
              },
            ),
          )
        
      );
    
  }
}
