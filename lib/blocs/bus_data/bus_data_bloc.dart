import 'dart:async';

import 'package:track_my_travel/data/models/bus_data/bus_data.dart';
import 'package:track_my_travel/data/models/bus_data/minimum_info_update.dart';
import 'package:track_my_travel/data/respository/bus_data_repository.dart';
import 'package:rxdart/rxdart.dart';

class BusDataBloc {
  BusDataRepository _busDataRepository;
  Timer timer;

  List<String> selectedRoutes;

  final _busDataSubject = BehaviorSubject<List<MinimumInfoUpdate>>(
      seedValue: List<MinimumInfoUpdate>());

  Stream<List<MinimumInfoUpdate>> get busData => _busDataSubject.stream;

  var _busData = BusData();

  BusDataBloc(BusDataRepository busDataRepository)
      : _busDataRepository = busDataRepository,
        selectedRoutes = ['1', '15', '22'] {
    _getBusData();

    timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer t) => _getBusData(),
    );
  }

  Future _getBusData() async {
    print('getting bus data');
    _busData = await _busDataRepository.getBusData();
    List<MinimumInfoUpdate> filteredBusData = _busData.minimumInfoUpdates
        .where((update) => selectedRoutes.contains(update.line))
        .toList();
    _busDataSubject.add(filteredBusData);
  }

  void close() {
    _busDataSubject.close();
  }
}
