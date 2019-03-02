import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bus_tracker/data/repositories/bus_data_repository.dart';
import 'package:bus_tracker/blocs/bus_data/bus_data_presentation.dart';

class BusDataBloc extends Bloc<BusDataEvent, BusDataState> {
  final BusDataRepository _busDataRepository;

  BusDataBloc(this._busDataRepository) : super();

  void getBusData() {
    dispatch(GetBusData());
  }

  @override
  BusDataState get initialState => BusDataState.initial();

  @override
  Stream<BusDataState> mapEventToState(
      BusDataState currentState, BusDataEvent event) async* {
    if (event is GetBusData) {
      yield* mapGetBusData(event);
    }
  }

  Stream<BusDataState> mapGetBusData(GetBusData event) async* {
    try {
      final busData = await _busDataRepository.getMinimumInfoUpdates();
      yield BusDataState.successful(busData);
    } on NoMinimumUpdatesException catch (e) {
      yield BusDataState.failure(e.message);
    }
  }
}
