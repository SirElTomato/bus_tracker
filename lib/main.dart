import 'package:bus_tracker/injection_container.dart';
import 'package:bus_tracker/presentation/bus_data/map_page.dart';
import 'package:flutter/material.dart';
import 'package:permission/permission.dart';

void main() {
  // initKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Island Mapper',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MapPage(),
    );
  }
}
