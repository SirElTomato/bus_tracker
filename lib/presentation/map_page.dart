import 'dart:collection';

import 'package:bus_tracker/blocs/bus_data/bus_data_presentation.dart';
import 'package:bus_tracker/blocs/preferences/preferences_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_tracker/blocs/bus_data/bus_data_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _busDataBloc = kiwi.Container().resolve<BusDataBloc>();
  final _prefsBloc = PrefsBloc();
  GoogleMapController mapController;
  // List<SelectedRoute> _selectedRoutes;
  // HashMap<String, Marker> _busMarkers = new HashMap<String, Marker>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _busDataBloc,
      child: _buildScaffold(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _busDataBloc.dispose();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track my Travel'),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                getData();
              })
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.schedule), title: Text('Routes')),
        BottomNavigationBarItem(icon: Icon(Icons.stop), title: Text('Stops')),
      ]),
      body: BlocBuilder(
          bloc: _busDataBloc,
          builder: (context, BusDataState state) {
            if (state.isInitial) {
              _clearStaleMarkers();
              return _buildMap();
            }
            if (state.isSuccessful) {
              return _buildMap();
            } else {
              return Text(
                'Uh oh!',
              );
            }
          }),
    );
  }

  void getData() {
    _busDataBloc.getBusData();
  }

  Column _clearStaleMarkers() {
    return Column(children: [
      Center(
        child: Text(
          'Remove all stale markers',
        ),
      ),
      FloatingActionButton(
        onPressed: () => getData(),
      )
    ]);
  }

  Center _buildMap() {
    return Center(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            CameraPosition(target: LatLng(49.218360, -2.139824), zoom: 11),
        cameraTargetBounds: CameraTargetBounds(
          LatLngBounds(
            southwest: LatLng(49.11, -2.25),
            northeast: LatLng(49.31, -2.00),
          ),
        ),
        minMaxZoomPreference: MinMaxZoomPreference(11, null),
        myLocationEnabled: true,
        compassEnabled: true,
        rotateGesturesEnabled: true,
        tiltGesturesEnabled: true,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
    const oneSec = const Duration(milliseconds: 1000);
    // new Timer.periodic(oneSec, (Timer t) => _fetchDataAndDrawMarkers());
  }
}
