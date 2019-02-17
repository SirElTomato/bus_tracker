import 'package:bus_tracker/models/app_state.dart';
import 'package:bus_tracker/presentation/home_page.dart';
import 'package:bus_tracker/redux/actions.dart';
import 'package:flutter/material.dart';
import 'package:permission/permission.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:bus_tracker/redux/middleware.dart';
import 'package:bus_tracker/reducers/app_state_reducer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    checkPermissions();
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: [appStateMiddleware],
    );

    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'Island Mapper',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        routes: {
          HomePage.route: (context) => HomePage(
                onInit: () {
                  StoreProvider.of<AppState>(context)
                      .dispatch(GetSelectedRoutesAction());
                  StoreProvider.of<AppState>(context)
                      .dispatch(GetSettingsAction());
                },
              )
        },
      ),
    );
  }

  Future checkPermissions() async {
    List<Permissions> permissionStatuses =
        await Permission.getPermissionsStatus([PermissionName.Location]);

    for (int i = 0; i < permissionStatuses.length; i++) {
      if (permissionStatuses[i].permissionStatus == PermissionStatus.notDecided) {
        await Permission.requestPermissions(
            [permissionStatuses[i].permissionName]);
      }
    }
  }
}
