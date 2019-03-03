import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:track_my_travel/data/models/serializers/serializers.dart';

part 'bus_stop.g.dart';

abstract class BusStop implements Built<BusStop, BusStopBuilder> {
  static Serializer<BusStop> get serializer => _$busStopSerializer;

  int get StopNumber;
  String get StopName;
  double get Latitude;
  double get Longitude;
  int get DistanceAwayInMetres;

  BusStop._();

  factory BusStop([updates(BusStopBuilder b)]) = _$BusStop;

  static BusStop fromJson(String jsonString) {
    return serializers.deserializeWith(
        BusStop.serializer, jsonDecode(jsonString));
  }
}
