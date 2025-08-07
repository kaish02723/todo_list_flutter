import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'DeleteUsersPage.dart';
import 'UpdateUsersPage.dart';

void main() {
  runApp(CardView());
}

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StateManageCard(),
    );
  }
}

class StateManageCard extends StatefulWidget {
  const StateManageCard({super.key});

  @override
  State<StateManageCard> createState() => _StateManageCardState();
}

class _StateManageCardState extends State<StateManageCard> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}


// body: SingleChildScrollView
// (
// child: Column(
// children: [
// Container(
// height: 450,
// width: double.infinity,
// padding: EdgeInsets.symmetric(horizontal: 10),
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.all(Radius.circular(10))),
// elevation: 5,
// child: Stack(
// children: [
// Container(
// height: 280,
// width: 400,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: NetworkImage(
// "https://picsum.photos/250?image=9"),
// fit: BoxFit.cover,
// ),
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(10),
// topLeft: Radius.circular(10))),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 305, top: 8),
// child: PopupMenuButton(
// iconSize: 30,
// iconColor: Colors.white,
// itemBuilder: (context) {
// return [
// PopupMenuItem(
// child: Row(
// children: [
// Icon(
// Icons.edit,
// color: Colors.blueAccent,
// ),
// Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Text("Edit",
// style: TextStyle(
// fontSize: 14,
// color: Colors.blueAccent)),
// )
// ],
// ),
// value: "update",
// ),
// PopupMenuItem(
// child: Row(
// children: [
// Icon(Icons.delete, color: Colors.red),
// Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Text("Delete",
// style: TextStyle(
// fontSize: 14, color: Colors.red)),
// )
// ],
// ),
// value: "delete",
// )
// ];
// },
// onSelected: (value) {
// if (value == "update") {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => UpdateUsersPage(),
// ));
// } else if (value == "delete") {
// showDialog(
// context: context,
// builder: (context) {
// return AlertDialog(
// title:
// Center(child: Text("Confirm Deletion")),
// content: Text(
// textAlign: TextAlign.center,
// "Are you sure you want to delete\nthis task?"),
// actions: [
// Row(
// crossAxisAlignment:
// CrossAxisAlignment.center,
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// TextButton(
// onPressed: () {
// Navigator.of(context)
//     .pop(); // Dialog band karne ke liye
// },
// child: Text("Cancel",
// style: TextStyle(
// color: Colors.black87)),
// ),
// TextButton(
// onPressed: () {
// // Delete action yaha likho
// Navigator.of(context)
//     .pop(); // Dialog band karne ke baad
// },
// child: Text(
// "OK",
// style: TextStyle(
// color: Colors.black87),
// ),
// ),
// ],
// )
// ],
// );
// },
// );
// }
// },
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(padding: EdgeInsets.only(top: 295)),
// Row(
// children: [
// Padding(padding: EdgeInsets.only(left: 15)),
// Text(
// "Title: ",
// style: TextStyle(fontSize: 16),
// ),
// Text("titleValue",
// style: TextStyle(fontSize: 16)),
// ],
// ),
// Row(
// children: [
// Padding(padding: EdgeInsets.only(left: 15)),
// Text("Description: ",
// style: TextStyle(fontSize: 16)),
// Text("descriptionValue",
// style: TextStyle(fontSize: 16)),
// ],
// ),
// Row(
// children: [
// Padding(padding: EdgeInsets.only(left: 15)),
// Text("Address: ", style: TextStyle(fontSize: 16)),
// Text("addressValue",
// style: TextStyle(fontSize: 16)),
// ],
// ),
// SizedBox(
// height: 10,
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 10),
// child: FaIcon(
// isCheck
// ? FontAwesomeIcons.circleExclamation
//     : FontAwesomeIcons.circleExclamation,
// color: isCheck ? Colors.green : Colors.red,
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 15),
// child: Text(
// isCheck ? "Uncompleted" : "Uncompleted",
// style: TextStyle(
// color:
// isCheck ? Colors.green : Colors.red,
// fontSize: 17),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 130),
// child: Checkbox(
// activeColor: Colors.green,
// value: isCheck,
// onChanged: (value) {
// setState(() {
// isCheck = value!;
// });
// },
// ),
// )
// ],
// )
// ],
// )
// ],
// ),
// )),
// ],
// ),
// )
// ,