import 'package:flutter/material.dart';
import 'package:weatherapp/server/server.dart';
import 'package:weatherapp/data/string.dart';

import 'package:weatherapp/pages/search_cities.dart';

class CitiesPage extends StatefulWidget {
  final Server server;
  CitiesPage({required this.server, Key? key}) : super(key: key);

  @override
  _CitiesPageState createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(Strings.getValue('SELECTCITY')),
            pinned: true,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchCitiesPage(server: widget.server,)));
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget> [
              Padding(
                padding: const EdgeInsets.only(top: 14.0, left: 14.0),
                child: Text(Strings.getValue('RECENT'), style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate(getCities()),
          ),
        ],
      ),
    );
  }

  List<Widget> getCities() {
    var cities = widget.server.getCities();

    var list = <Widget>[];

    for (int i = 0; i < cities.length; i++) {
      list.add(ListTile(
        title: Text(Strings.getValue(cities[i])),
        onTap: () {
          widget.server.curCity = cities[i];
          Navigator.pop(context);
        },
      ));
    }

    return list;
  }
}
