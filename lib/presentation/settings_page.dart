import 'package:bus_tracker/components/tab_selector.dart';
import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/presentation/change_icon_size_page.dart';
import 'package:bus_tracker/view_models/settings_view_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:permission/permission.dart';
import 'package:redux/redux.dart';
import 'package:flare_flutter/flare_actor.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  final Store<AppState> store;

  SettingsPage({Key key, this.title, this.store}) : super(key: key);

  @override
  State createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  int iconSize = IconSize.small;
  bool _isSelected = false;

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
      body: StoreConnector<AppState, SettingsPageViewModel>(
          converter: (Store<AppState> store) =>
              SettingsPageViewModel.create(store),
          builder: (BuildContext context, SettingsPageViewModel viewModel) =>
              buildSettings(context)),
    );
  }

  Widget buildSettings(BuildContext context) {
    // return ListView.separated(separatorBuilder: (context, index) => Divider(
    //     color: Colors.black,
    //   ),
    //   itemBuilder: () => <Widget>[
    //   ListTile(
    //     title: Text('Change bus marker icon size'),
    //     trailing: Icon(Icons.format_size),
    //     onTap: () => Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => ChangeIconSizePage())),
    //   ),
    //   ListTile(
    //     title: Text('Show my location on the map'),
    //     trailing: Icon(Icons.format_size),
    //     onTap: () => Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => ChangeIconSizePage())),
    //   )
    // ],);
    double screenWidth = MediaQuery.of(context).size.width;

    return ListView(children: <Widget>[
      ListTile(
        title: Text('Change bus marker icon size'),
        trailing: Icon(Icons.launch),
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChangeIconSizePage())),
      ),
      ListTile(
        title: Text('Show my location on the map'),
        trailing: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
          width: screenWidth * 0.2,
          height: screenWidth * 0.3,
          // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          child: FlareActor(
            "assets/flare/Smiley Switch.flr",
            // alignment: Alignment(2, 0),
            // alignment: Alignment.centerRight,
            fit: BoxFit.fitHeight,
            animation: _isSelected ? "On" : "Off",
          ),
        ),
        onTap: () => handleChange(),
      ),
    ]);
  }

  void handleChange() {
    setState(() {
      switch (_isSelected) {
        case true:
          _isSelected = !_isSelected;
          break;
        case false:
          checkPermissions();
          _isSelected = !_isSelected;
          break;
        default:
      }
    });
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
}
