import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_list/main.dart';

void main() {
  runApp(AddUsersPage());
}

class AddUsersPage extends StatefulWidget {
  const AddUsersPage({super.key});

  @override
  State<AddUsersPage> createState() => _AddUsersPageState();
}

class _AddUsersPageState extends State<AddUsersPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StateManageAdd(),
    );
  }
}

class StateManageAdd extends StatefulWidget {
  const StateManageAdd({super.key});

  @override
  State<StateManageAdd> createState() => _StateManageAddState();
}

class _StateManageAddState extends State<StateManageAdd> {
  var taskTitle=TextEditingController();
  var taskDescription=TextEditingController();

  bool isInternetConnection = false;
  StreamSubscription? _streamSubscriptionConnected;
  //image ke liye
  File? _imageSelected;
  final _picker=ImagePicker();

   pickImageGallery() async {
  final pickImage=await _picker.pickImage(source: ImageSource.gallery);
  if(pickImage!= null){
    setState(() {
    });
    _imageSelected=File(pickImage.path);
  }
  }

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
        title: Text("Add Your Tasks"),
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
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: SizedBox(
                            height: 180,
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Choose Image Source"),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 15)),
                                    InkWell(onTap: () {
                                      pickImageGallery();
                                      Navigator.pop(context);
                                    } , child: Icon(Icons.image_outlined)),
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    Text("Gallery")
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 15)),
                                    Icon(Icons.camera_alt),
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    Text("Camera")
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: _imageSelected==null?Image.asset("assets/logo.png"):Image.file(_imageSelected!,fit: BoxFit.cover,width: 120,height: 120,),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                child: Column(
                  children: [
                    TextField(
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
                  ],
                ),

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
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Tasks added successfully!"),
                        backgroundColor: Colors.grey[700],
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(
                          bottom: 20,
                          left: 20,
                          right: 20,
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );

                  },
                  child: Text(
                    "Add Task",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  imagePicerAlertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Choose Image Source"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 15)),
                      Icon(Icons.image_outlined),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text("Gallery")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 15)),
                      Icon(Icons.camera_alt),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text("Camera")
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

