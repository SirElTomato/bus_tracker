import 'package:flutter/material.dart';
import 'package:track_my_travel/blocs/preferences/preferences_bloc.dart';
import 'package:track_my_travel/injection_container.dart';
import 'package:track_my_travel/presentation/pages/map_page.dart';

void main() {
  initKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final preferencesBloc = PreferencesBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MapPage(
        preferencesBloc: preferencesBloc,
      ),
    );
  }
}
