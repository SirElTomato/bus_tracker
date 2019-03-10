import 'package:flutter/material.dart';
import 'package:track_my_travel/blocs/route_data/route_data_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:track_my_travel/data/models/route_data/bus_route.dart';
import 'package:track_my_travel/extensions.dart';

class SelectRoutesPage extends StatefulWidget {
  @override
  _SelectRoutesPageState createState() => _SelectRoutesPageState();
}

class _SelectRoutesPageState extends State<SelectRoutesPage> {
  final _routeDataBloc = kiwi.Container().resolve<RouteDataBloc>();
  static const allTileWidth = 0.563;
  static const genericTileWidth = 0.25;
  static const tileHeight = 0.25;
  static const edgeLeft = 0.063;
  static const edgeTop = 0.05;
  static const edgeRight = 0.00;
  static const edgeBottom = 0.01;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Routes'),
      ),
      body: StreamBuilder<List<BusRoute>>(
          stream: _routeDataBloc.routeData,
          initialData: List<BusRoute>(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              screenWidth = MediaQuery.of(context).size.width;
              return _buildRouteSelector(snapshot.data);
            }
          }),
    );
  }

  SingleChildScrollView _buildRouteSelector(List<BusRoute> data) {
    List<GridTile> routeTiles = data
        .map((route) =>
            (_createRouteTile(route.Number, route.Colour, genericTileWidth)))
        .toList();

    routeTiles.insert(0, _createRouteTile("All", "#b70005", allTileWidth));

    return SingleChildScrollView(
      child: Wrap(
        children: routeTiles,
      ),
    );
  }

  GridTile _createRouteTile(
      String routeNumber, String colorInHex, double tileWidth) {
    return GridTile(
      child: Opacity(
        opacity: 1,
        child: Container(
          child: Center(
            child: Text(
              routeNumber,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          width: tileWidth * screenWidth,
          height: tileHeight * screenWidth,
          margin: EdgeInsets.fromLTRB(
              edgeLeft * screenWidth,
              edgeTop * screenWidth,
              edgeRight * screenWidth,
              edgeBottom * screenWidth),
          decoration: BoxDecoration(
            color: HexColor(colorInHex),
            borderRadius: BorderRadius.all(const Radius.circular(50)),
          ),
        ),
      ),
    );
  }
}
