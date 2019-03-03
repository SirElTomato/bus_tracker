import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:track_my_travel/data/models/serializers/serializers.dart';

part 'minimum_info_update.g.dart';

abstract class MinimumInfoUpdate
    implements Built<MinimumInfoUpdate, MinimumInfoUpdateBuilder> {
  static Serializer<MinimumInfoUpdate> get serializer =>
      _$minimumInfoUpdateSerializer;

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

  static MinimumInfoUpdate fromJson(String jsonString) {
    return serializers.deserializeWith(
        MinimumInfoUpdate.serializer, jsonDecode(jsonString));
  }
}
