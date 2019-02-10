import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:bus_tracker/models/app_state.dart';
import 'package:bus_tracker/models/bus_data.dart';
import 'package:bus_tracker/presentation/select_routes_page.dart';
import 'package:bus_tracker/view_models/home_page_view_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {
  final String title;
  final Store<AppState> store;

  HomePage({Key key, this.title, this.store}) : super(key: key);

  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  GoogleMapController mapController;
  List<SelectedRoute> _selectedRoutes;
  HashMap<String, Marker> _busMarkers = new HashMap<String, Marker>();

  @override
  void initState() {
    super.initState();
    const oneSec = const Duration(milliseconds: 3600);
    new Timer.periodic(oneSec, (Timer t) => _fetchDataAndDrawMarkers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
          converter: (Store<AppState> store) => HomePageViewModel.create(store),
          builder: (BuildContext context, HomePageViewModel viewModel) =>
              _buildMap(viewModel),
        ));
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
          try {
            // TODO: add option to choose marker size from settings
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
