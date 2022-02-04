// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/ContactUs.dart';
import 'package:flutterfire_samples/screens/user_info_screen.dart';
import 'package:flutterfire_samples/weather.dart';

class TabControllerClass extends StatefulWidget {
  const TabControllerClass({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _TabControllerClassState createState() => _TabControllerClassState();
}

class _TabControllerClassState extends State<TabControllerClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          bottom: const TabBar(
            tabs: [
              Tab(text: "Profile Info"),
              Tab(text: "Weather Info"),
              Tab(text: "Contact Us"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UserInfoScreen(user: widget._user),
            Weather(),
            const ContactUs(),
          ],
        ),
      ),
    ));
  }
}
