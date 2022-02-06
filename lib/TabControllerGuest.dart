// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:weatherapp/forecast.dart';
import 'package:weatherapp/screens/sign_in_screen.dart';
import 'ContactUs.dart';

class TabControllerClassGuest extends StatefulWidget {
  const TabControllerClassGuest({Key? key}) : super(key: key);

  @override
  _TabControllerClassGuestState createState() =>
      _TabControllerClassGuestState();
}

class _TabControllerClassGuestState extends State<TabControllerClassGuest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          bottom: TabBar(
            tabs: const [
              Tab(
                text: "Profile Info",
              ),
              Tab(text: "Weather Info"),
              Tab(text: "contact Us"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You're Logged as Guest So there's no User info",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        },
                        child: const Text('Back to login page'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Forecast(),
            const ContactUs(),
          ],
        ),
      ),
    ));
  }
}