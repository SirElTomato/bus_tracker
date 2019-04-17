import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:track_my_travel/blocs/bus_data/bus_data_bloc.dart';
import 'package:track_my_travel/blocs/preferences/preferences_bloc.dart';
import 'package:track_my_travel/data/models/bus_data/minimum_info_update.dart';
import 'package:track_my_travel/presentation/widgets/map_page_options_widget.dart';
import 'package:track_my_travel/presentation/widgets/map_widget.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class MapPage extends StatefulWidget {
  final PreferencesBloc preferencesBloc;

  const MapPage({Key key, this.preferencesBloc}) : super(key: key);

  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _busDataBloc = kiwi.Container().resolve<BusDataBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Track my Travel',
        ),
      ),
      // drawer: Drawer(),
      floatingActionButton: MapPageOptionsWidget(
        preferencesBloc: widget.preferencesBloc,
      ),
      body: BlocBuilder<BusDataEvent, BehaviorSubject<List<MinimumInfoUpdate>>>(
        bloc: _busDataBloc,
        builder: (BuildContext context, snapshot) =>
            MapWidget(_busDataBloc, widget.preferencesBloc),
      ),
    );
  }

  @override
  void dispose() {
    widget.preferencesBloc.close();
    super.dispose();
  }
}
