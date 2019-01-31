import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_cs_cache/flutter_cs_cache.dart';
import 'bus_data.dart';
import 'route_data.dart';
import 'extensions.dart';

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

  SingleChildScrollView _buildRouteSelector() {
    if (_routeData != null) {
      GridTile selectAllTile = new GridTile(
        child: InkResponse(
            enableFeedback: true,
            onTap: () => _handleRouteClicked("All"),
            // onLongPress: , TODO: show route on map
            child: Container(
              child: Center(
                  child: Text("All",
                      style: TextStyle(color: Colors.white, fontSize: 24))),
              width: 220,
              height: 88,
              margin: new EdgeInsets.fromLTRB(20, 20, 15, 0),
              decoration: new BoxDecoration(
                  color: Color(0xffb70005),
                  borderRadius: BorderRadius.all(const Radius.circular(100))),
            )),
      );

      List<GridTile> routeRows = _routeData.routes
          .map((route) => new GridTile(
                  child: InkResponse(
                enableFeedback: true,
                onTap: () => _handleRouteClicked(route.number),
                // onLongPress: , TODO: show route on map
                child: Container(
                  child: Center(
                      child: Text(route.number,
                          style: TextStyle(color: Colors.white, fontSize: 24))),
                  // color: Colors.red,
                  width: 98,
                  height: 98,
                  margin: new EdgeInsets.fromLTRB(20, 20, 15, 0),
                  decoration: new BoxDecoration(
                      color: HexColor(route.colour),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(50))),
                ),
              )))
          .toList();
      routeRows.insert(0, selectAllTile);

      return new SingleChildScrollView(
          child: new Wrap(
        children: routeRows.toList(),
      ));
    } else {
      fetchRouteData();
      _buildRouteSelector();
    }
  }

  void _handleRouteClicked(String route) {
    debugPrint(route);
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
