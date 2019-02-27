library bus_data_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:bus_tracker/data/models/data_models.dart';

part 'bus_data_state.g.dart';

abstract class BusDataState
    implements Built<BusDataState, BusDataStateBuilder> {
  BuiltList<MinimumInfoUpdate> get minimumInfoUpdates;
  String get error;

  bool get isInitial => minimumInfoUpdates.isEmpty && error == '';

  bool get isSuccessful => minimumInfoUpdates.isNotEmpty && error == '';

  BusDataState._();

  factory BusDataState([updates(BusDataStateBuilder b)]) = _$BusDataState;

  factory BusDataState.initial() {
    return BusDataState((b) => b
      ..minimumInfoUpdates.replace(BuiltList<MinimumInfoUpdate>())
      ..error = '');
  }

  factory BusDataState.failure(String error) {
    return BusDataState((b) => b
      ..minimumInfoUpdates.replace(BuiltList<MinimumInfoUpdate>())
      ..error = error);
  }

  factory BusDataState.successful(BuiltList<MinimumInfoUpdate> results) {
    return BusDataState((b) => b
      ..minimumInfoUpdates.replace(results)
      ..error = '');
  }
}
