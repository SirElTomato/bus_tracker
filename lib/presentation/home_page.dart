import 'package:bus_tracker/components/active_tab.dart';
import 'package:bus_tracker/components/tab_selector.dart';
import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/presentation/map_page.dart';
import 'package:bus_tracker/presentation/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

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
          return SettingsPage();
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
