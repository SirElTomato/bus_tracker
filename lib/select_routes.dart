import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'route_data.dart';
import 'extensions.dart';
import 'package:flutter_cs_cache/flutter_cs_cache.dart';

class SelectRoutesPage extends StatefulWidget {
  SelectRoutesPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State createState() => SelectRoutesPageState();
}

class SelectRoutesPageState extends State<SelectRoutesPage> {
  final CsCache cache = new CsCache();
  RouteData _routeData;
  Set<String> _selectedRoutes = new Set<String>();

  @override
  Widget build(BuildContext context) {
    fetchRouteData();

    return Scaffold(
        appBar: new AppBar(
          title: const Text('Select Routes'),
        ),
        body: _buildRouteSelector());
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
      GridTile selectAllTile = _createRouteTile("All", "#b70005", 220, 88);

      List<GridTile> routeRows = _routeData.routes
          .map((route) => _createRouteTile(route.number, route.colour, 98, 98))
          .toList();
      routeRows.insert(0, selectAllTile);

      return new SingleChildScrollView(
          child: new Wrap(
        children: routeRows.toList(),
      ));
    } else {
      // GridTile selectAllTile = _createRouteTile("All", "#b70005", 220, 88);
      // List<GridTile> routeRows = new List<GridTile>();
      // return new SingleChildScrollView(
      //     child: new Wrap(
      //   children: routeRows.toList(),
      // ));

      fetchRouteData();
      _buildRouteSelector();
    }
  }

  GridTile _createRouteTile(
      String routeName, String colorInHex, double width, double height) {
    final bool selected = _selectedRoutes.contains(routeName);
    double opacity = selected ? 1.0 : 0.2;

    return new GridTile(
        child: InkResponse(
            enableFeedback: true,
            onTap: () {
              setState(() {
                if (selected) {
                  _selectedRoutes.remove(routeName);
                } else {
                  _selectedRoutes.add(routeName);
                }
              });
            },
            // onLongPress: , TODO: show route on map
            child: Opacity(
              opacity: opacity,
              child: Container(
                child: Center(
                    child: Text(routeName,
                        style: TextStyle(color: Colors.white, fontSize: 24))),
                // color: Colors.red
                width: width,
                height: height,
                margin: new EdgeInsets.fromLTRB(20, 20, 15, 0),
                decoration: new BoxDecoration(
                    color: HexColor(colorInHex),
                    borderRadius: BorderRadius.all(const Radius.circular(50))),
              ),
            )));
  }

  void _handleRouteClicked(String route, bool selected) {
    setState(() {
      if (selected) {
        _selectedRoutes.remove(route);
      } else {
        _selectedRoutes.add(route);
      }
    });
  }
}
