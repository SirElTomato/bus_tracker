import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_cs_cache/flutter_cs_cache.dart';
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
  RouteData _routeData;

  final CsCache cache = new CsCache();

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
    String cacheKey = "routeData";
    String cacheEntry = cache.getKey(key: cacheKey);

    if (cacheEntry == null) {
      final response = await http.get(
          'http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetRoutes');

      if (response.statusCode == 200) {
        RouteData routeData = RouteData.fromJson(json.decode(response.body));
        _routeData = routeData;
        cache.setKey(
            key: cacheKey,
            value: response.body,
            expireOn: DateTime.now()
                .add(new Duration(seconds: 604800))
                .millisecondsSinceEpoch);
        setState(() {});
      } else {
        throw Exception('Failed to get bus data');
      }
    } else {
      RouteData routeData = RouteData.fromJson(json.decode(cacheEntry));
      _routeData = routeData;
    }
  }

  ListView _buildRouteSelector() {
    if (_routeData != null) {
      Set<ListTile> routeRows = _routeData.routes
          .map((route) => new ListTile(
              title: Text(route.number), trailing: new Icon((Icons.favorite))))
          .toSet();

      return new ListView(children: routeRows.toList());
    }
  }

  Widget _buildRouteRow(String busNumber) {
    return ListTile(
      title: Text(busNumber, style: const TextStyle(fontSize: 18.0)),
      trailing: new Icon(Icons.favorite),
    );
  }

  void _selectRoutesPage() {
    fetchRouteData();
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Scaffold(
              appBar: new AppBar(
                title: const Text('Select Routes'),
              ),
              body: _buildRouteSelector());
        },
      ),
    );
  }
}
