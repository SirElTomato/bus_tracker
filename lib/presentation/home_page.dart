import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:bus_tracker/components/active_tab.dart';
import 'package:bus_tracker/components/map_page_app_bar.dart';
import 'package:bus_tracker/components/tab_selector.dart';
import 'package:bus_tracker/containers/map_container.dart';
import 'package:bus_tracker/containers/settings_container.dart';
import 'package:bus_tracker/containers/timetable_container.dart';
import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/presentation/select_routes_page.dart';
import 'package:bus_tracker/view_models/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {
  final void Function() onInit;

  HomePage({@required this.onInit});

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  GoogleMapController mapController;
  List<SelectedRoute> _selectedRoutes;
  HashMap<String, Marker> _busMarkers = new HashMap<String, Marker>();
  @override
  void initState() {
    widget.onInit();
    super.initState();
    const oneSec = const Duration(milliseconds: 1000);
    new Timer.periodic(oneSec, (Timer t) => _fetchDataAndDrawMarkers());
  }

  @override
  Widget build(BuildContext context) {
    return ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        // Widget body;
        // Widget action;
        // if (activeTab == AppTab.map) {
        //   body = MapContainer();
        //   action = SelectRoutesPageAction();
        // } else if (activeTab == AppTab.settings) {
        //   body = SettingsContainer();
        // } else {
        //   body = TimetableContainer();
        // }
        // return Scaffold(
        //   appBar: AppBar(
        //     title: Text("Island Mapper"),
        //     actions: <Widget>[
        //       action
        //     ],
        //   ),
        //   body: body,
        //   bottomNavigationBar: TabSelector(),
        // );

        if (activeTab == AppTab.map) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Island Mapper"),
              actions: <Widget>[
                new IconButton(
                    icon: const Icon(Icons.list),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectRoutesPage()));
                    })
              ],
            ),
            body: StoreConnector<AppState, HomePageViewModel>(
              converter: (Store<AppState> store) =>
                  HomePageViewModel.create(store),
              builder: (BuildContext context, HomePageViewModel viewModel) =>
                  _buildMap(viewModel),
            ),
            bottomNavigationBar: TabSelector(),
          );
        } else if (activeTab == AppTab.settings) {
          return Scaffold(
            appBar: AppBar(title: Text("Settings")),
            body: SettingsContainer(),
            bottomNavigationBar: TabSelector(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: Text("Timetable")),
            body: TimetableContainer(),
            bottomNavigationBar: TabSelector(),
          );
        }
      },
    );
  }

  Center _buildMap(HomePageViewModel viewModel) {
    _selectedRoutes = viewModel.selectedRoutes;

    return Center(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            CameraPosition(target: LatLng(49.218360, -2.139824), zoom: 11),
        cameraTargetBounds: CameraTargetBounds(LatLngBounds(
            southwest: LatLng(49.11, -2.25), northeast: LatLng(49.31, -2.00))),
        minMaxZoomPreference: MinMaxZoomPreference(11, null),
        myLocationEnabled: true,
        compassEnabled: true,
        rotateGesturesEnabled: false,
        tiltGesturesEnabled: false,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  Future _fetchDataAndDrawMarkers() async {
    BusData busData = await _fetchBusData();
    await _updateBusMarkersOnMap(busData);
  }

  Future<BusData> _fetchBusData() async {
    final response = await http.get(
        'https://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetMin?secondsAgo=3600');
    if (response.statusCode == 200) {
      BusData busData = BusData.fromJson(json.decode(response.body));
      return busData;
    } else {
      throw Exception('Failed to get bus data');
    }
  }

  Future _updateBusMarkersOnMap(BusData busData) async {
    if (busData != null) {
      for (int i = 0; i < busData.minimumInfoUpdates.length; i++) {
        bool routeSelected = _selectedRoutes
                .where((x) => x.name == busData.minimumInfoUpdates[i].line)
                .length ==
            1;

        if (routeSelected) {
          // TODO: add option to choose marker size from settings
          try {
            MarkerOptions markerOptions = MarkerOptions(
                position: LatLng(busData.minimumInfoUpdates[i].lat,
                    busData.minimumInfoUpdates[i].lon),
                infoWindowText: InfoWindowText(
                    busData.minimumInfoUpdates[i].line,
                    busData.minimumInfoUpdates[i].direction),
                icon: BitmapDescriptor.fromAsset("assets/bus_markers/100/" +
                    busData.minimumInfoUpdates[i].line +
                    ".png"),
                rotation: busData.minimumInfoUpdates[i].bearing.toDouble());
            if (_busMarkers.containsKey(busData.minimumInfoUpdates[i].bus)) {
              await mapController.updateMarker(
                  _busMarkers[busData.minimumInfoUpdates[i].bus],
                  markerOptions);
            } else {
              Marker marker = await mapController.addMarker(markerOptions);
              _busMarkers[busData.minimumInfoUpdates[i].bus] = marker;
            }
          } catch (e) {
            MarkerOptions markerOptions = MarkerOptions(
                position: LatLng(busData.minimumInfoUpdates[i].lat,
                    busData.minimumInfoUpdates[i].lon),
                infoWindowText: InfoWindowText(
                    busData.minimumInfoUpdates[i].line,
                    busData.minimumInfoUpdates[i].direction),
                icon: BitmapDescriptor.fromAsset(
                    "assets/bus_markers/100/default.png"),
                rotation: busData.minimumInfoUpdates[i].bearing.toDouble());
            if (_busMarkers.containsKey(busData.minimumInfoUpdates[i].bus)) {
              await mapController.updateMarker(
                  _busMarkers[busData.minimumInfoUpdates[i].bus],
                  markerOptions);
            } else {
              Marker marker = await mapController.addMarker(markerOptions);
              _busMarkers[busData.minimumInfoUpdates[i].bus] = marker;
            }
          }
        } else {
          if (_busMarkers.containsKey(busData.minimumInfoUpdates[i].bus)) {
            Marker marker = _busMarkers[busData.minimumInfoUpdates[i].bus];
            await mapController.removeMarker(marker);
            _busMarkers.remove(busData.minimumInfoUpdates[i].bus);
          }
        }
      }
    }
  }
}

// class HomePage extends StatefulWidget {
//   final String title;
//   final Store<AppState> store;

//   HomePage({Key key, this.title, this.store}) : super(key: key);

//   @override
//   State createState() => HomePageState();
// }

// class HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//   List<BottomNavigationBarItem> _list = [
//     new BottomNavigationBarItem(
//       icon: Icon(Icons.map),
//       title: Text('Map'),
//     ),
//     new BottomNavigationBarItem(
//       icon: Icon(Icons.featured_play_list),
//       title: Text('Timetable'),
//     ),
//     new BottomNavigationBarItem(
//         icon: Icon(Icons.person), title: Text('Settings'))
//   ];

//   final List<Widget> _pages = [
//   //  Page1(title: 'Page1', store: store)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, HomePageViewModel>(
//       converter: (Store<AppState> store) => HomePageViewModel.create(store),
//       builder: (BuildContext context, HomePageViewModel viewModel) =>
//           _pages[viewModel.currentIndex],
//     );
//   }

//   // Widget getPage(store)

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }
