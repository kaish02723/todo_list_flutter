
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


alert(var context){
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text("Confirm Deletion!"),
      content: Text("Are you sure you want to delete\nthis task?"),
      actions: [
        TextButton(onPressed: () {

        }, child: Text("Cancel")),
        TextButton(onPressed: () {

        }, child: Text("OK")),
      ],
    );
  },);
}