import 'package:flutter/material.dart';
import 'package:track_my_travel/blocs/bus_data/bus_data_bloc.dart';
import 'package:track_my_travel/data/models/bus_data/bus_data.dart';
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
      body: StreamBuilder<BusData>(
          stream: _busDataBloc.busData,
          initialData: BusData(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.data.minimumInfoUpdates.isNotEmpty) {
              return Center(
                child: MapWidget(),
              );
              return ListView(
                children: snapshot.data.minimumInfoUpdates
                    .map((update) => buildTile(update.lat.toString()))
                    .toList(),
              );
            } else {
              return Center(
                child: Text('no data'),
              );
            }
          }),
    );
  }

  ListTile buildTile(String name) {
    return ListTile(title: Text(name));
  }
}
