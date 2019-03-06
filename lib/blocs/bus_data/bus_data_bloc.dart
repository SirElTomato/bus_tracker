import 'dart:async';

import 'package:track_my_travel/data/models/bus_data/bus_data.dart';
import 'package:track_my_travel/data/respository/bus_data_repository.dart';
import 'package:rxdart/rxdart.dart';

class BusDataBloc {
  BusDataRepository _busDataRepository;

  final _busDataSubject = BehaviorSubject<BusData>();

  Stream<BusData> get busData => _busDataSubject.stream;

  var _busData = BusData();

  BusDataBloc(BusDataRepository busDataRepository) {
    this._busDataRepository = busDataRepository;

    _getBusData();
    startUpdatingBusData();
  }

  void startUpdatingBusData() {
    const oneSec = const Duration(milliseconds: 1000);
    new Timer.periodic(oneSec, (Timer t) => _getBusData());
  }

  Future _getBusData() async {
    _busData = await _busDataRepository.getBusData();
    _busDataSubject.add(_busData);
  }

  void close() {
    _busDataSubject.close();
  }
}
