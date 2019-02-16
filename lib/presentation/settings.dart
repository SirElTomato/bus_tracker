import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:bus_tracker/components/tab_selector.dart';
import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/presentation/change_icon_size_page.dart';
import 'package:bus_tracker/presentation/select_routes_page.dart';
import 'package:bus_tracker/view_models/home_page_view_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redux/redux.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  final Store<AppState> store;

  SettingsPage({Key key, this.title, this.store}) : super(key: key);

  @override
  State createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  double _sliderValue = 1.0;
  int iconSize = IconSize.small;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      bottomNavigationBar: TabSelector(),
      body: StoreConnector<AppState, HomePageViewModel>(
          converter: (Store<AppState> store) => HomePageViewModel.create(store),
          builder: (BuildContext context, HomePageViewModel viewModel) =>
              buildSettings),
    );
  }

  Widget get buildSettings {
    return ListView(children: <Widget>[
      ListTile(
        title: Text('Change Bus Marker Icon Size'),
        trailing: Icon(Icons.format_size),
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChangeIconSizePage())),
      )
    ]);
  }
}
