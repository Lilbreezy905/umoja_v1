import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umoja_v1/common/utils/utils.dart';
import 'package:umoja_v1/features/video/views/screens/profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchedName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor:Theme.of(context).colorScheme.background,
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
                // User user = searchController.searchedUsers[index];
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(uid: data["uid"]),
                    ),
                  ),
                  child: ListTile(
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
                  ),
                );
              },
            );
          }),
    );
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   List _allResult = [];
//   List resultList = [];
//   final TextEditingController searchController = TextEditingController();
//   @override
//   void initState() {
//     searchController.addListener(_onSearchedChaged);
//     super.initState();
//   }

//   _onSearchedChaged() {
//     print(searchController.text);
//     searchResult();
//   }

//   searchResult() {
//     var showResult = [];
//     if (searchController.text.isNotEmpty) {
//       for (var clientSnapshot in _allResult) {
//         var name = clientSnapshot["name"].toString().toLowerCase();
//         if (name.contains(searchController.text.toLowerCase())) {
//           showResult.add(clientSnapshot);
//         }
//       }
//     } else {
//       showResult = List.from(_allResult);
//     }
//     setState(() {
//       resultList = showResult;
//     });
//   }

//   getClientStream() async {
//     var data = await FirebaseFirestore.instance
//         .collection("users")
//         .orderBy("name")
//         .get();
//     setState(() {
//       _allResult = data.docs;
//     });
//     searchResult();
//   }

//   @override
//   void dispose() {
//     searchController.removeListener(_onSearchedChaged);
//     searchController.dispose();
//     super.dispose();
//   }

//   @override
//   void didChangeDependencies() {
//     getClientStream();
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         // title: TextFormField(
//         //   onChanged: (value) {
//         //     setState(() {});
//         //   },
//         //   decoration: const InputDecoration(
//         //     hintText: "Search User",
//         //   ),
//         // )),
//         title: CupertinoSearchTextField(
//           controller: searchController,
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: resultList.length,
//         itemBuilder: (context, index) {
//           final data = resultList[index];
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundImage: NetworkImage(data["profilePic"]),
//             ),
//             title: data["name"],
//             trailing: data["phoneNumber"],
//           );
//         },
//       ),
//     );
//   }
// }
