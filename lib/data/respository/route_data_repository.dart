import 'dart:async';

import 'package:track_my_travel/data/models/route_data/route_data.dart';
import 'package:track_my_travel/data/network/route_data_source.dart';

class RouteDataRepository {
  RouteDataSource _routeDataSource;

  RouteDataRepository(this._routeDataSource);

  Future<RouteData> getRouteData() async {
    RouteData routeData;
    routeData = await _routeDataSource.getRouteData();

    if (routeData == null) {
      throw NoRouteDataException();
    }

    return routeData;
  }
}

class NoRouteDataException implements Exception {
  final message = 'No route data';
}
