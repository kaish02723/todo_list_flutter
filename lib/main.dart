import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:todo_list/DataFile/Local/Db_Helper.dart';
import 'package:todo_list/DataFile/Local/userModel.dart';
import 'AddUsersPage.dart';
import 'CardViewPage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StateManageCard(),
    );
  }
}

class StateManage extends StatefulWidget {
  @override
  State<StateManage> createState() => _StateManageState();
}

class _StateManageState extends State<StateManage> {
  StreamSubscription? _streamSubscriptionInternet;
  bool isInternetCoonnected = false;

  @override
  void initState() {
    _streamSubscriptionInternet = InternetConnection().onStatusChange.listen(
      (event) {
        switch (event) {
          case InternetStatus.connected:
            setState(() {
              isInternetCoonnected = true;
            });
          case InternetStatus.disconnected:
            setState(() {
              isInternetCoonnected = false;
            });
          default:
            isInternetCoonnected = false;
        }
      },
    );
    //sqlite
    _loadingTask();
    //sqlite
  }

  @override
  void dispose() {
    _streamSubscriptionInternet?.cancel();
  }

//sqlite
  final DBHelper _dbHelper=DBHelper();
  List<UserTaskModel> _taskModel=[];

Future<void> _loadingTask() async {
  final task=await _dbHelper.getTask();
  setState(() {
    _taskModel =task;
  });
}
//sqlite

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF33F1FF),

        ///74CFF8FF
        title: Text("ToDo All Lists"),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Icon(
                  isInternetCoonnected ? Icons.wifi : Icons.wifi_off,
                  color: isInternetCoonnected ? Colors.green : Colors.red,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  isInternetCoonnected ? "Connected" : "DisConnected",
                  style: TextStyle(
                      color: isInternetCoonnected ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddUsersPage(),
              ));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF33F1FF),
        shape: CircleBorder(),
      ),
    );
  }
}
