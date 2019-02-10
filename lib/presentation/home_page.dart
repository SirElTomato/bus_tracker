import 'package:bus_tracker/components/active_tab.dart';
import 'package:bus_tracker/components/tab_selector.dart';
import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/presentation/map_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final void Function() onInit;

  HomePage({@required this.onInit});

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        if (activeTab == AppTab.map) {
          return MapPage();
        } else if (activeTab == AppTab.settings) {
          return Scaffold(
            appBar: AppBar(title: Text("Settings")),
            body: Center(child: Text('Settings')),
            bottomNavigationBar: TabSelector(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: Text("Timetable")),
            body: Center(child: Text('Timetable')),
            bottomNavigationBar: TabSelector(),
          );
        }
      },
    );
  }
}
