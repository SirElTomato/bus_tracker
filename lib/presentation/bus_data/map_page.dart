import 'package:bus_tracker/presentation/bus_data/bus_data_presentation.dart';
import 'package:bus_tracker/presentation/bus_data/bus_data_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_tracker/data/network/bus_data_source.dart';
import 'package:bus_tracker/data/repositories/bus_data_repository.dart';
import 'package:bus_tracker/presentation/bus_data/bus_data_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;

class MapPage extends StatefulWidget {
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _mapPageBloc = kiwi.Container().resolve<BusDataBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _mapPageBloc,
      child: _buildScaffold(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _mapPageBloc.dispose();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: AppBar(title: Text('Map page')),
      body: BlocBuilder(
          bloc: _mapPageBloc,
          builder: (context, BusDataState state) {
            if (state.isInitial) {
              //something
              return Column(children: [
                Center(
                  child: Text(
                    'Select routes or bus stops',
                  ),
                ),
                FloatingActionButton(
                  onPressed: () => getData(),
                )
              ]);
            }
            if (state.isSuccessful) {
              return Column(children: [
                Center(
                  child: Text(
                    state.minimumInfoUpdates.toString(),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () => getData(),
                )
              ]);
            } else {
              return Text(
                'Uh oh!',
              );
            }
          }),
    );
  }

  void getData() {
    _mapPageBloc.getBusData();
  }
}
