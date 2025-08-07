import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:lottie/lottie.dart';

class UpdateUsersPage extends StatefulWidget {
  const UpdateUsersPage({super.key});

  @override
  State<UpdateUsersPage> createState() => _AddUsersPageState();
}

class _AddUsersPageState extends State<UpdateUsersPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StateManageUpdate(),
    );
  }
}

class StateManageUpdate extends StatefulWidget {
  const StateManageUpdate({super.key});

  @override
  State<StateManageUpdate> createState() => _StateManageAddState();
}

class _StateManageAddState extends State<StateManageUpdate> {
  bool isInternetConnection = false;
  StreamSubscription? _streamSubscriptionConnected;

  @override
  void dispose() {
    _streamSubscriptionConnected?.cancel();
  }

  @override
  void initState() {
    _streamSubscriptionConnected = InternetConnection().onStatusChange.listen(
      (event) {
        switch (event) {
          case InternetStatus.connected:
            setState(() {
              isInternetConnection = true;
            });
          case InternetStatus.disconnected:
            setState(() {
              isInternetConnection = true;
            });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text("Update Your Tasks"),
        backgroundColor: Color(0xFF33F1FF),
        actions: [
          ///lottie loding animation build
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Lottie.network(
              isInternetConnection
                  ? "https://lottie.host/50bc8efc-d0ac-4c6f-b623-2ef1c5df97ca/eVXkQhwM6E.json"
                  : "https://lottie.host/50bc8efc-d0ac-4c6f-b623-2ef1c5df97ca/eVXkQhwM6E.json",
              width: 30,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    // child: Image.network(""),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 00.1, color: Colors.black26),
                    ),
                    hintText: "Enter your title",
                    prefixIcon: Icon(Icons.perm_contact_cal_outlined),
                    label: Text("Title"),
                    fillColor: Color(0xFFEAF0E5),
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.0, color: Colors.black26),
                    ),
                    hintText: "Enter your Description",
                    prefixIcon: Icon(Icons.perm_contact_cal_outlined),
                    label: Text("Description"),
                    fillColor: Color(0xFFEAF0E5),
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF97A98B),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: Text(
                    "Update Task",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
