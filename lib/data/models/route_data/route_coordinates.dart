import 'package:built_value/built_value.dart';

part 'route_coordinates.g.dart';

abstract class RouteCoordinates
    implements Built<RouteCoordinates, RouteCoordinatesBuilder> {
  // fields go here

  RouteCoordinates._();

  factory RouteCoordinates([updates(RouteCoordinatesBuilder b)]) =
      _$RouteCoordinates;
}
