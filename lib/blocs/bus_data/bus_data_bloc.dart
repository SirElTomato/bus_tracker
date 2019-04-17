import 'dart:async';

import 'package:track_my_travel/data/models/bus_data/bus_data.dart';
import 'package:track_my_travel/data/models/bus_data/minimum_info_update.dart';
import 'package:track_my_travel/data/respository/bus_data_repository.dart';
import 'package:rxdart/rxdart.dart';

class BusDataBloc {
  BusDataRepository _busDataRepository;
  Timer timer;

  final _busDataSubject = BehaviorSubject<List<MinimumInfoUpdate>>.seeded(
      List<MinimumInfoUpdate>());

  Stream<List<MinimumInfoUpdate>> get busData => _busDataSubject.stream;

  var _busData = BusData();

  BusDataBloc(BusDataRepository busDataRepository)
      : _busDataRepository = busDataRepository {
    _getBusData();

    timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer t) => _getBusData(),
    );
  }

  Future _getBusData() async {
    print('getting bus data');
    _busData = await _busDataRepository.getBusData();
    _busDataSubject.add(_busData.minimumInfoUpdates.toList());
  }

  void close() {
    _busDataSubject.close();
  }
}
