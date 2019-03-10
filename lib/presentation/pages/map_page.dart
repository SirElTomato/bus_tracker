import 'package:flutter/material.dart';
import 'package:track_my_travel/blocs/bus_data/bus_data_bloc.dart';
import 'package:track_my_travel/data/models/bus_data/bus_data.dart';
import 'package:track_my_travel/data/models/bus_data/minimum_info_update.dart';
import 'package:track_my_travel/presentation/widgets/map_page_options_widget.dart';
import 'package:track_my_travel/presentation/widgets/map_widget.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class MapPage extends StatefulWidget {
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _busDataBloc = kiwi.Container().resolve<BusDataBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   title: Text(
        //     'Track my Travel',
        //   ),
        // ),
        drawer: Drawer(),
        floatingActionButton: MapPageOptionsWidget(),
        body: StreamBuilder<List<MinimumInfoUpdate>>(
          stream: _busDataBloc.busData,
          initialData: List<MinimumInfoUpdate>(),
          builder: (context, snapshot) => ListView(
                children: snapshot.data
                    .map((update) => buildTile(update.time))
                    .toList(),
              ),
        )

        // Center(
        //   child: MapWidget(_busDataBloc),
        // ),
        );
  }

  ListTile buildTile(String name) {
    return ListTile(title: Text(name));
  }
}
