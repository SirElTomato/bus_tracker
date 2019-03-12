import 'package:flutter/material.dart';
import 'package:track_my_travel/blocs/preferences/preferences_bloc.dart';
import 'package:track_my_travel/injection_container.dart';
import 'package:track_my_travel/presentation/pages/map_page.dart';
import 'package:permission/permission.dart';

void main() {
  initKiwi();
  checkPermissions();
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

  // Future checkPermissions() async {
  //   PermissionStatus locationPermission = await PermissionHandler()
  //       .checkPermissionStatus(PermissionGroup.location);

  //   if (locationPermission.value != PermissionStatus.granted.value) {
  //     Map<PermissionGroup, PermissionStatus> permissions =
  //         await PermissionHandler()
  //             .requestPermissions([PermissionGroup.location]);
  //   }
  // }

}

Future checkPermissions() async {
  List<Permissions> permissionStatuses =
      await Permission.getPermissionsStatus([PermissionName.Location]);

  for (int i = 0; i < permissionStatuses.length; i++) {
    if (permissionStatuses[i].permissionStatus != PermissionStatus.allow) {
      await Permission.requestPermissions(
          [permissionStatuses[i].permissionName]);
    }
  }
}
