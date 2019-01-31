import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  Set<String> _routes = new Set<String>();

  @override
  Widget build(BuildContext context) {
    fetchPost(); //TODO: Put this on a timer?

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.list), onPressed: _selectRoutes)
          ],
        ),
        body: Center(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
          ),
        ));
  }

  void fetchPost() async {
    final response = await http.get(
        'https://sojbuslivetimespublic.azurewebsites.net/api/Values/GetMin?secondsAgo=3600');
    if (response.statusCode == 200) {
      BusData busData = BusData.fromJson(json.decode(response.body));
      _busData = busData;
      // _routes.add(busData.minimumInfoUpdates[0].line);
      // for (var i = 0; i < busData.minimumInfoUpdates.length; i++) {
      //   _routes.add(busData.minimumInfoUpdates[i].line);
      // }
      // busData.minimumInfoUpdates.map((bus) => _routes.add(bus.line));
    } else {
      throw Exception('Failed to get bus data');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  ListView _buildRouteSelector() {
    // return ListView.builder(
    //     padding: const EdgeInsets.all(16.0),
    //     itemBuilder: /*1*/ (context, i) {
    //       if (i.isOdd) return Divider(); /*2*/

    //       final index = i ~/ 2; /*3*/
    //       for (int i = 0; i < _busData.minimumInfoUpdates.length; i++) {
    //         Widget route =
    //             _buildRouteRow(_busData.minimumInfoUpdates[i].toString());
    //         return route;
    //       }
    //     });
    // List<ListTile> routeRows = _busData.minimumInfoUpdates.map((bus) => new ListTile(title: bus.toString(), trailing: new Icon(Icons.favorite)));

    // List<ListTile> routeRows = _routes.map((bus) => new ListTile(title: Text(bus)));
    List<String> list = ['one', 'two', 'three', 'four'];

    List<Text> widgets = list.map((name) => new Text(name)).toList();

    return new ListView(children: widgets);
  }

  Widget _buildRouteRow(String busNumber) {
    return ListTile(
      title: Text(busNumber, style: const TextStyle(fontSize: 18.0)),
      trailing: new Icon(Icons.favorite),
    );
  }

  void _selectRoutes() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
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


class BusData {
  final List<MinimumInfoUpdate> minimumInfoUpdates;
  final List<dynamic> stops;

  BusData({this.minimumInfoUpdates, this.stops});

  factory BusData.fromJson(Map<String, dynamic> json) {
    var minimumInfoUpdatesFromJson = json['minimumInfoUpdates'] as List;

    List<MinimumInfoUpdate> minimumInfoUpdatesList = minimumInfoUpdatesFromJson.map((i) => 
    MinimumInfoUpdate.fromJson(i)).toList();

    return BusData(
        minimumInfoUpdates: minimumInfoUpdatesList, stops: json['stops']);
  }
}


class MinimumInfoUpdate {
  final String bus;
  final String line;
  final String cat;
  final double lat;
  final double lon;
  final int bearing;
  final String direction;
  final String time;
  final int age;

  MinimumInfoUpdate(
      {this.bus,
      this.line,
      this.cat,
      this.lat,
      this.lon,
      this.bearing,
      this.direction,
      this.time,
      this.age});

  factory MinimumInfoUpdate.fromJson(Map<String, dynamic> json) {
    return MinimumInfoUpdate(
      bus: json['bus'],
      line: json['line'],
      cat: json['cat'],
      lat: json['lat'],
      lon: json['lon'],
      bearing: json['bearing'],
      direction: json['direction'],
      time: json['time'],
      age: json['age'],
    );
  }
}
