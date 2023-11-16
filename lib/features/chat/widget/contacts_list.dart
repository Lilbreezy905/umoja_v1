import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/features/user_profile/screens/user_profile.dart';

import '../../../colors.dart';

import '../screens/mobile_chat_screen.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: 
            ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MobileChatScreen.routeName,
                                  arguments: {
                                    'name': "User Name",
                                    'uid': "chatContact.contactId",
                                    'isGroupChat': false,
                                    'profilePic': "assets/U1.png",
                                  });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: ListTile(
                                title: Text(
                                  "Brice",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Text(
                                  "hi",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                                leading: GestureDetector(
                                  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserProfile())),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/U1.png"),
                                    radius: 30,
                                  ),
                                ),
                                trailing: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                          color:  Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text("hello"
                                    ,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Divider(color: dividerColor, indent: 85),
                        ],
                      );
                    },
                  ),
                  )
                  ;
                }
         
       
     
  }

