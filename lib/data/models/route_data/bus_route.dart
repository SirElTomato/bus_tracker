import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:track_my_travel/data/models/route_data/route_coordinates.dart';

part 'bus_route.g.dart';

abstract class BusRoute implements Built<BusRoute, BusRouteBuilder> {
  int get id;
  String get number;
  String get name;
  String get colour;
  String get colourInverse;
  BuiltList<RouteCoordinates> get routeCoordinates;
  bool get active;

  BusRoute._();

  factory BusRoute([updates(BusRouteBuilder b)]) = _$BusRoute;
}
