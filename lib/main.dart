import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'bus_data.dart';
import 'route_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Island Mapper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Island Mapper'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  GoogleMapController mapController;
  BusData _busData;
  List<String> routes = [
    "1",
    "1a",
    "1g",
    "2",
    "2a",
    "3",
    "4",
    "4a",
    "5",
    "6",
    "7",
    "8",
    "9",
    "12",
    "12a",
    "13",
    "15",
    "16",
    "19",
    "20",
    "21",
    "22",
    "x22",
    "23"
  ];

  @override
  Widget build(BuildContext context) {
    fetchBusData(); //TODO: Put this on a timer?

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.list), onPressed: _selectRoutesPage)
          ],
        ),
        body: Center(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
          ),
        ));
  }

  // bus data
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

  // route stuff
  void fetchRouteData() async {
    final response = await http.get(
        'http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetRoutes');
    if (response.statusCode == 200) {
      RouteData routeData = RouteData.fromJson(json.decode(response.body));
      var route = routeData;
      // _busData = busData;
    } else {
      throw Exception('Failed to get bus data');
    }
  }

  ListView _buildRouteSelector() {
    Set<ListTile> routeRows = routes
        .map((route) => new ListTile(
            title: Text(route), trailing: new Icon((Icons.favorite))))
        .toSet();

    return new ListView(children: routeRows.toList());
  }

  Widget _buildRouteRow(String busNumber) {
    return ListTile(
      title: Text(busNumber, style: const TextStyle(fontSize: 18.0)),
      trailing: new Icon(Icons.favorite),
    );
  }

  void _selectRoutesPage() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          fetchRouteData();
          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Select Routes'),
            ),
            body: _buildRouteSelector(),
          );
        },
      ),
    );
  }
}
