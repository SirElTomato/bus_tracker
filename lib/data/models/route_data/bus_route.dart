import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:track_my_travel/data/models/route_data/route_coordinates.dart'
    as RC;
import 'package:track_my_travel/data/models/serializers/serializers.dart';

part 'bus_route.g.dart';

abstract class BusRoute implements Built<BusRoute, BusRouteBuilder> {
  static Serializer<BusRoute> get serializer => _$busRouteSerializer;

  int get Id;
  String get Number;
  String get Name;
  String get Colour;
  String get ColourInverse;
  BuiltList<RC.RouteCoordinates> get RouteCoordinates;
  bool get Active;

  BusRoute._();

  factory BusRoute([updates(BusRouteBuilder b)]) = _$BusRoute;

  static BusRoute fromJson(String jsonString) {
    return serializers.deserializeWith(
        BusRoute.serializer, jsonDecode(jsonString));
  }
}
