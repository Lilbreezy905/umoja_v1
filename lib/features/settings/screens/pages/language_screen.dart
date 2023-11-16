// // ignore_for_file: unnecessary_null_comparison

// import 'package:flutter/material.dart';
// import 'package:umoja_v1/language/classes/language.dart';
// import 'package:umoja_v1/main.dart';

// class LanguageScreen extends StatelessWidget {
//   const LanguageScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> dataWidget(Language? language) {
//       List<Widget> dataWidget = [];
//       dataWidget = [
//         const ListTile(
//           title: Text(
//             "English",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 1.1,
//           child: const Divider(
//             thickness: 0.4,
//             color: Colors.white,
//           ),
//         ),
//         const ListTile(
//           title: Text(
//             "French",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 1.1,
//           child: const Divider(
//             thickness: 0.4,
//             color: Colors.white,
//           ),
//         ),
//         const ListTile(
//           title: Text(
//             "Spanish",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 1.1,
//           child: const Divider(
//             thickness: 0.4,
//             color: Colors.white,
//           ),
//         ),
//         const ListTile(
//           title: Text(
//             "Kirundi",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 1.1,
//           child: const Divider(
//             thickness: 0.4,
//             color: Colors.white,
//           ),
//         ),
//         const ListTile(
//           title: Text(
//             "Swahili",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 1.1,
//           child: const Divider(
//             thickness: 0.4,
//             color: Colors.white,
//           ),
//         ),
//       ];
//       return dataWidget;
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text("Language"),
//         leading: null,
//       ),
//       body: ListView.builder(
//           itemCount: dataWidget().length,
//           itemBuilder: (context, index) {
//             return SafeArea(
//               child: Center(
//                 child: Column(
//                   children: [
//                     dataWidget()[index],
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }
