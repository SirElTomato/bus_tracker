import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:track_my_travel/blocs/bus_data/bus_data_bloc.dart';
import 'package:track_my_travel/blocs/preferences/preferences_bloc.dart';
import 'package:track_my_travel/blocs/preferences/preferences_state.dart';
import 'package:track_my_travel/data/models/bus_data/minimum_info_update.dart';

class MapPageBloc {
  final PreferencesBloc _preferencesBloc;
  final BusDataBloc _busDataBloc;

  final _filteredBusDataSubject = BehaviorSubject<List<MinimumInfoUpdate>>(
      seedValue: List<MinimumInfoUpdate>());

  List<MinimumInfoUpdate> _busData;

  PreferencesState _preferencesState;

  MapPageBloc(PreferencesBloc preferencesBloc, BusDataBloc busDataBloc)
      : _preferencesBloc = preferencesBloc,
        _busDataBloc = busDataBloc {
    _busDataBloc.busData.listen((busDataFromSource) {
      _busData = busDataFromSource;
      _filterBusData();
    });

    _preferencesBloc.currentPreferences.listen((preferences) {
      _preferencesState = preferences;
      _filterBusData();
    });
  }

  Stream<List<MinimumInfoUpdate>> get filteredBusData =>
      _filteredBusDataSubject.stream;

  _filterBusData() {
    _filteredBusDataSubject.add(_busData
        .where(
            (update) => _preferencesState.selectedRoutes.contains(update.line))
        .toList());
  }
}
