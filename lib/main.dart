import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_my_travel/blocs/bus_data/bus_data_bloc.dart';
import 'package:track_my_travel/blocs/preferences/preferences_bloc.dart';
import 'package:track_my_travel/injection_container.dart';
import 'package:track_my_travel/presentation/pages/map_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

void main() async {
  initKiwi();
  await checkPermissions();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _preferencesBloc = PreferencesBloc();
  final _busDataBloc = kiwi.Container().resolve<BusDataBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<PreferencesBloc>(bloc: _preferencesBloc),
        BlocProvider<BusDataBloc>(bloc: _busDataBloc),
      ],
      child: Container(),
    );

    return MaterialApp(
      title: 'Track My Travel',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MapPage(
        preferencesBloc: _preferencesBloc,
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
