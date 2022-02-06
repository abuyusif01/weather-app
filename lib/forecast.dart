import 'package:flutter/material.dart';
import 'package:weatherapp/pages/host.dart';
import 'package:weatherapp/server/test_server.dart';
import 'package:weatherapp/data/string.dart';

class Forecast extends StatefulWidget {
  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.getValue('WEATHER'),
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF7D64FF, <int, Color>{
          50: Color(0xFF7D64FF),
          100: Color(0xFF7D64FF),
          200: Color(0xFF7D64FF),
          300: Color(0xFF7D64FF),
          400: Color(0xFF7D64FF),
          500: Color(0xFF7D64FF),
          600: Color(0xFF7D64FF),
          700: Color(0xFF7D64FF),
          800: Color(0xFF7D64FF),
          900: Color(0xFF7D64FF),

        }),
      ),
      home: HomePage(server: TestServer(),),
    );
  }
}
