import 'package:flutter/material.dart';
import 'package:track_my_travel/blocs/preferences/preferences_bloc.dart';
import 'package:track_my_travel/injection_container.dart';
import 'package:track_my_travel/presentation/pages/map_page.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  initKiwi();
  await checkPermissions();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final preferencesBloc = PreferencesBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track My Travel',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MapPage(
        preferencesBloc: preferencesBloc,
      ),
    );
  }
}

Future checkPermissions() async {
  PermissionStatus locationPermission =
      await PermissionHandler().checkPermissionStatus(PermissionGroup.location);

  if (locationPermission != PermissionStatus.granted) {
    await PermissionHandler().requestPermissions([PermissionGroup.location]);
  }
}
