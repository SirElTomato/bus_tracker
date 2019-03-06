import 'package:track_my_travel/data/network/bus_data_source.dart';
import 'package:track_my_travel/data/respository/bus_data_repository.dart';
import 'package:track_my_travel/blocs/bus_data/bus_data_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((c) => BusDataSource(c.resolve()))
    ..registerFactory((c) => BusDataRepository(c.resolve()))
    ..registerFactory((c) => BusDataBloc(c.resolve()));
}
