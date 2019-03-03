import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:track_my_travel/data/models/route_data/bus_route.dart';

part 'route_data.g.dart';

abstract class RouteData implements Built<RouteData, RouteDataBuilder> {
  static Serializer<RouteData> get serializer => _$routeDataSerializer;

  BuiltList<BusRoute> get routes;

  RouteData._();

  factory RouteData([updates(RouteDataBuilder b)]) = _$RouteData;
}
