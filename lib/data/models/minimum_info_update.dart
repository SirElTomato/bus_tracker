library minimum_info_update;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:bus_tracker/data/serializers/serializers.dart';

part 'minimum_info_update.g.dart';

abstract class MinimumInfoUpdate
    implements Built<MinimumInfoUpdate, MinimumInfoUpdateBuilder> {
  String get bus;
  String get line;
  String get cat;
  double get lat;
  double get lon;
  int get bearing;
  String get direction;
  String get time;
  int get age;

  MinimumInfoUpdate._();

  factory MinimumInfoUpdate([updates(MinimumInfoUpdateBuilder b)]) =
      _$MinimumInfoUpdate;

  String toJson() {
    return json
        .encode(serializers.serializeWith(MinimumInfoUpdate.serializer, this));
  }

  static MinimumInfoUpdate fromJson(String jsonString) {
    return serializers.deserializeWith(
        MinimumInfoUpdate.serializer, json.decode(jsonString));
  }

  static Serializer<MinimumInfoUpdate> get serializer =>
      _$minimumInfoUpdateSerializer;
}
