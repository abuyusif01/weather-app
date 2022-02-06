import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/server/server.dart';
import 'package:weatherapp/data/string.dart';
import 'package:weatherapp/data/weather.dart';
import 'dart:async';

import 'package:weatherapp/pages/cities.dart';
import 'package:weatherapp/pages/settings.dart';

class HomePage extends StatefulWidget {
  final Server server;
  HomePage({Key? key, required this.server}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Widget> _weekItems;

  Future<Null> _updateWeekItems() async{

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _weekItems = List.from(_getWeekItems());
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    _weekItems = _getWeekItems();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _updateWeekItems,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              expandedHeight: 350.0,
              actions: _getActions(),
              leading: IconButton(
                icon: Icon(Icons.near_me),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CitiesPage(server: widget.server,)));
                },
                color: Colors.white,
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(Strings.getValue(widget.server.curCity)),
                centerTitle: true,
                collapseMode: CollapseMode.pin,
                background: Container(
                  color: Theme.of(context).primaryColor,
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text(Strings.getValue('NOW'),
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Text(_getHeaderTime(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                              fontSize: 12.0
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 80.0),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('${widget.server.isC ? widget.server.getCurrentWeather(widget.server.curCity).dayTemp
                                : Weather.toFahrenheit(widget.server.getCurrentWeather(widget.server.curCity).dayTemp)}°', style: TextStyle(
                                color: Colors.white,
                                fontSize: 54.0
                            ),
                            ),
                            Text(widget.server.isC ? 'C' : 'F', style: TextStyle(
                                color: Colors.white,
                                fontSize: 34.0
                            ),
                            ),
                          ],
                        ),
                        Text(Strings.getValue(widget.server.getCurrentWeather(widget.server.curCity).type), style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                            fontSize: 14.0
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, left: 14.0),
                    child: Text(Strings.getValue('NXTW'), style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500
                    ),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(_weekItems),
            ),
          ],
        ),
      ),
    );
  }

  _getHeaderTime() {
    var time = DateTime.now();
    var format = DateFormat("dd.MM.yy");

    late String d;

    switch (time.weekday) {
      case 1:
        d = Strings.getValue('MON');
        break;
      case 2:
        d = Strings.getValue('TUE');
        break;
      case 3:
        d = Strings.getValue('WED');
        break;
      case 4:
        d = Strings.getValue('THU');
        break;
      case 5:
        d = Strings.getValue('FRI');
        break;
      case 6:
        d = Strings.getValue('SAT');
        break;
      case 7:
        d = Strings.getValue('SUN');
        break;
    }
    
    return '$d, ${format.format(time)}';
  }

  _getActions() {
    return <Widget> [
      IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(server: widget.server,)));
        },
        icon: Icon(Icons.settings),
        color: Colors.white,
      )
    ];
  }

  _getWeekItems() {
    var widgets = <Widget>[];

    var time = DateTime.now();
    var format = DateFormat("dd.MM.yy");

    var weathers = widget.server.getWeatherForNextWeek(widget.server.curCity);

    for (int i = 0; i < 7; i++) {
      late String d;

      if (i == 0) {
        d = Strings.getValue('TOD');
      } else if (i == 1) {
        d = Strings.getValue('TOMR');
      } else {
        switch (time.weekday) {
          case 1:
            d = Strings.getValue('MOND');
            break;
          case 2:
            d = Strings.getValue('TUES');
            break;
          case 3:
            d = Strings.getValue('WEDN');
            break;
          case 4:
            d = Strings.getValue('THUR');
            break;
          case 5:
            d = Strings.getValue('FRID');
            break;
          case 6:
            d = Strings.getValue('SATU');
            break;
          case 7:
            d = Strings.getValue('SUND');
            break;
        }
      }

      var timeString = format.format(time);

      time = time.add(Duration(days: 1));

      widgets.add(ListTile(
        title: Text(d, style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 20
        ),
        ),
        subtitle: Text(timeString, style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w100,
            color: Colors.black
        ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('${widget.server.isC ? weathers[i].dayTemp : Weather.toFahrenheit(weathers[i].dayTemp)}°', style: TextStyle(
                fontSize: 20.0
            ),
            ),
            Text(widget.server.isC ? 'C' : 'F', style: TextStyle(
                fontSize: 16.0
            ),
            ),
            Padding(padding: EdgeInsets.only(left: 5),),
            Text('${widget.server.isC ? weathers[i].nightTemp : Weather.toFahrenheit(weathers[i].nightTemp)}°', style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
                fontWeight: FontWeight.w300
            ),
            ),
            Text(widget.server.isC ? 'C' : 'F', style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
                fontWeight: FontWeight.w300
            ),
            ),
          ],
        ),
      ));
    }

    return widgets;
  }
}
