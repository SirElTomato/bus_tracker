import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:bus_tracker/data/models/data_models.dart';
import 'package:bus_tracker/data/network/bus_data_source.dart';

class BusDataRepository {
  BusDataSource _busDataSource;

  BusDataRepository(this._busDataSource);

  Future<BuiltList<MinimumInfoUpdate>> getMinimumInfoUpdates() async {
    final busData = await _busDataSource.getBusData();
    if (busData.minimumInfoUpdates.isEmpty) throw NoMinimumUpdatesException();
    return busData.minimumInfoUpdates;
  }
}

class NoMinimumUpdatesException implements Exception {
  final message = 'No minimum info updates';
}
