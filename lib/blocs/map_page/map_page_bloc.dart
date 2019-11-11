import 'package:track_my_travel/blocs/bus_data/bus_data_bloc.dart';
import 'package:track_my_travel/blocs/preferences/preferences_bloc.dart';

class MapPageBloc {
  final PreferencesBloc preferencesBloc;
  final BusDataBloc busDataBloc;

  MapPageBloc(this.preferencesBloc, this.busDataBloc);
}
