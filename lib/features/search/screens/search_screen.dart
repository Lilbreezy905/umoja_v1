import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umoja_v1/common/utils/utils.dart';
import 'package:umoja_v1/features/chat/screens/mobile_chat_screen.dart';

class SearchScreenContact extends StatefulWidget {
  const SearchScreenContact({Key? key}) : super(key: key);

  @override
  State<SearchScreenContact> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreenContact> {
  var searchedName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       elevation: 1,

        backgroundColor: Theme.of(context).colorScheme.background,
        title: TextFormField(
          onChanged: (value) {
            setState(() {
              searchedName = value;
            });
          },
          decoration: const InputDecoration(
            filled: false,
            hintText: 'Search User',
            hintStyle: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .orderBy("name".toLowerCase())
              .startAt([searchedName.toLowerCase()]).endAt(
                  ["$searchedName\uf8ff"]).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              showSnackBar(context: context, content: "error while searching");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Colors.white,
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.docs[index];
                
                return 
                ListTile(
                  onTap: () =>Navigator.pushNamed(
                                  context, MobileChatScreen.routeName,
                                  arguments: {
                                    'name': data["name"],
                                    'uid': data["uid"],
                                    'isGroupChat': false,
                                    'profilePic': data["profilePic"],
                                  }),
                    leading: CircleAvatar(
                      
                      backgroundImage: NetworkImage(
                        data["profilePic"],
                      ),
                    ),
                    title: Text(
                      data["name"],
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  );
              },
            );
          }),
    );
  }
}