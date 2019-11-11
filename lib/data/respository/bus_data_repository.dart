import 'dart:async';

import 'package:track_my_travel/data/models/bus_data/bus_data.dart';
import 'package:track_my_travel/data/network/bus_data_source.dart';

class BusDataRepository {
  BusDataSource _busDataSource;

  BusDataRepository(this._busDataSource);

  Future<BusData> getBusData([double lat, double lon]) async {
    BusData busData;
    if (lat != null && lon != null) {
      busData = await _busDataSource.getBusData(lat, lon);
    } else {
      busData = await _busDataSource.getBusData();
    }

    if (busData == null) {
      throw NoBusDataException();
    }

    return busData;
  }
}

class NoBusDataException implements Exception {
  final message = 'No bus data';
}

class NoMinimumUpdatesException implements Exception {
  final message = 'No minimum info updates';
}
