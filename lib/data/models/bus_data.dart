library bus_data;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:bus_tracker/data/models/data_models.dart';
import 'package:bus_tracker/data/serializers/serializers.dart';

part 'bus_data.g.dart';

abstract class BusData implements Built<BusData, BusDataBuilder> {
  BuiltList<MinimumInfoUpdate> get minimumInfoUpdates;

  BusData._();

  factory BusData([updates(BusDataBuilder b)]) = _$BusData;

  String toJson() {
    return json.encode(serializers.serializeWith(BusData.serializer, this));
  }

  static BusData fromJson(String jsonString) {
    return serializers.deserializeWith(
        BusData.serializer, json.decode(jsonString));
  }

  static Serializer<BusData> get serializer => _$busDataSerializer;
}
