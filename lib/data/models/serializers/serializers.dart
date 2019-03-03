library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:track_my_travel/data/models/bus_data/bus_data.dart';
import 'package:track_my_travel/data/models/bus_data/bus_stop.dart';
import 'package:track_my_travel/data/models/bus_data/minimum_info_update.dart';
import 'package:track_my_travel/data/models/route_data/bus_route.dart';
import 'package:track_my_travel/data/models/route_data/route_coordinates.dart';
import 'package:track_my_travel/data/models/route_data/route_data.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  BusData,
  MinimumInfoUpdate,
  BusStop,
  RouteData,
  BusRoute,
  RouteCoordinates,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
