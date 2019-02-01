import 'package:bus_tracker/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:permission/permission.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    checkPermissions();

    return MaterialApp(
      title: 'Island Mapper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Island Mapper'),
    );
  }

  Future checkPermissions() async {
    List<Permissions> permissionStatuses =
        await Permission.getPermissionsStatus([PermissionName.Location]);

    for (int i = 0; i < permissionStatuses.length; i++) {
      if (permissionStatuses[i].permissionStatus ==
          PermissionStatus.notDecided) {
        await Permission.requestPermissions(
            [permissionStatuses[i].permissionName]);
      }
    }
  }
}
