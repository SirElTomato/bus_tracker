import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:track_my_travel/data/models/bus_data/bus_stop.dart';
import 'package:track_my_travel/data/models/bus_data/minimum_info_update.dart';
import 'package:track_my_travel/data/models/serializers/serializers.dart';

part 'bus_data.g.dart';

abstract class BusData implements Built<BusData, BusDataBuilder> {
  static Serializer<BusData> get serializer => _$busDataSerializer;

  BuiltList<MinimumInfoUpdate> get minimumInfoUpdates;
  BuiltList<BusStop> get busStops;

  BusData._();

  factory BusData([updates(BusDataBuilder b)]) = _$BusData;

  static BusData fromJson(String jsonString) {
    return serializers.deserializeWith(
        BusData.serializer, jsonDecode(jsonString));
  }
}
