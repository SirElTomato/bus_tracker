import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:track_my_travel/data/models/serializers/serializers.dart';

part 'route_coordinates.g.dart';

abstract class RouteCoordinates
    implements Built<RouteCoordinates, RouteCoordinatesBuilder> {
  static Serializer<RouteCoordinates> get serializer =>
      _$routeCoordinatesSerializer;

  double get lat;
  double get lon;
  bool get isVital;
  bool get occasional;
  String get direction;
  @nullable
  String get splitSection;

  RouteCoordinates._();

  factory RouteCoordinates([updates(RouteCoordinatesBuilder b)]) =
      _$RouteCoordinates;

  static RouteCoordinates fromJson(String jsonString) {
    return serializers.deserializeWith(
        RouteCoordinates.serializer, jsonDecode(jsonString));
  }
}
