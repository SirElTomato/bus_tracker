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
  static const allTileWidth = 0.25;
  static const tileWidth = 0.25;
  static const tileHeight = 0.25;
  static const edgeLeft = 0.063;
  static const edgeTop = 0.05;
  static const edgeRight = 0.00;
  static const edgeBottom = 0.01;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Routes'),
      ),
      body: StreamBuilder<List<BusRoute>>(
        stream: _routeDataBloc.routeData,
        initialData: List<BusRoute>(),
        builder: (context, snapshot) => SingleChildScrollView(
              child: Wrap(
                children: snapshot.data
                    .map((route) => _createRouteTile(route))
                    .toList(),
              ),
            ),
      ),
    );
  }

  GridTile _createRouteTile(BusRoute busRoute) {
    return GridTile(
      child: Opacity(
        opacity: 1,
        child: Container(
          child: Center(
            child: Text(
              busRoute.Name,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          width: tileWidth,
          height: tileHeight,
          margin: EdgeInsets.fromLTRB(edgeLeft, edgeTop, edgeRight, edgeBottom),
          decoration: BoxDecoration(
            color: HexColor(busRoute.Colour),
            borderRadius: BorderRadius.all(const Radius.circular(50)),
          ),
        ),
      ),
    );
  }
}
