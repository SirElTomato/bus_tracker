import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:track_my_travel/data/models/route_data/bus_route.dart';
import 'package:track_my_travel/data/models/route_data/route_data.dart';
import 'package:track_my_travel/data/respository/route_data_repository.dart';

class RouteDataBloc {
  RouteDataRepository _routeDataRepository;

  final _routeDataSubject = BehaviorSubject<List<BusRoute>>();

  Stream<List<BusRoute>> get routeData => _routeDataSubject.stream;

  var _routeData = RouteData();

  RouteDataBloc(RouteDataRepository routeDataRepository)
      : _routeDataRepository = routeDataRepository {
    _getRouteData();
  }

  Future _getRouteData() async {
    print('getting bus data');
    _routeData = await _routeDataRepository.getRouteData();
    _routeDataSubject.add(_routeData.routes.toList());
  }

  void close() {
    _routeDataSubject.close();
  }
}
