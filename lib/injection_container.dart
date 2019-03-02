import 'package:bus_tracker/data/network/bus_data_source.dart';
import 'package:bus_tracker/data/repositories/bus_data_repository.dart';
import 'package:bus_tracker/blocs/bus_data/bus_data_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((c) => BusDataSource(c.resolve()))
    ..registerFactory((c) => BusDataRepository(c.resolve()))
    ..registerFactory((c) => BusDataBloc(c.resolve()));
}
