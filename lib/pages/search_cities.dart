import 'package:flutter/material.dart';
import 'package:weatherapp/server/server.dart';
import 'package:weatherapp/data/string.dart';

class SearchCitiesPage extends StatefulWidget {
  final Server server;

  SearchCitiesPage({required this.server});

  @override
  _SearchCitiesPageState createState() => _SearchCitiesPageState();
}

class _SearchCitiesPageState extends State<SearchCitiesPage> {
  late List<String> _allCities;
  late  List<String> _sortedCities;


  @override
  void initState() {
    super.initState();
    _allCities = widget.server.getCities();
    _sortedCities = List.from(_allCities);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (text) {
            setState(() {
              _sortedCities = List.from(_allCities.where((f) => Strings.getValue(f).toLowerCase().contains(text.toLowerCase())));
            });
          },
          style: TextStyle(
            color: Colors.white
          ),
          autofocus: true,
          decoration: InputDecoration(
            hintText: Strings.getValue('SEARCH_CITY'),
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.white
            )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _sortedCities.map((f) => ListTile(
            title: Text(Strings.getValue(f)),
            onTap: () {
              widget.server.curCity = f;
              Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
            },
          )).toList(),
        ),
      ),
    );
  }
}
