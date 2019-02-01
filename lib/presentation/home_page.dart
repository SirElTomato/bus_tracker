import 'dart:convert';
import 'package:bus_tracker/models/bus_data.dart';
import 'package:bus_tracker/presentation/select_routes_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  GoogleMapController mapController;
  BusData _busData;

  @override
  Widget build(BuildContext context) {
    fetchBusData(); //TODO: Put this on a timer?

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
        body: Center(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: LatLng(49.218360, -2.139824), zoom: 11),
            cameraTargetBounds: CameraTargetBounds(LatLngBounds(southwest: LatLng(49.11, -2.25), northeast: LatLng(49.31, -2.00))),
            minMaxZoomPreference: MinMaxZoomPreference(11, null),
            myLocationEnabled: true,
          ),
        ));
  }

  void fetchBusData() async {
    final response = await http.get(
        'https://sojbuslivetimespublic.azurewebsites.net/api/Values/GetMin?secondsAgo=3600');
    if (response.statusCode == 200) {
      BusData busData = BusData.fromJson(json.decode(response.body));
      _busData = busData;
    } else {
      throw Exception('Failed to get bus data');
    }
  }

  // map stuff
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}
