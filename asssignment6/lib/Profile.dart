import 'package:flutter/material.dart';

import 'global.dart';
class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  var date=dateInput.text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Column(
          children: [
            Text("$name"),
            Text("$gender"),
            Text("$date"),
            Text("$selectedDepartment"),



          ],
        )
    );
  }


}
