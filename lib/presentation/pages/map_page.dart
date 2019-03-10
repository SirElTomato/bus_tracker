import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  GoogleMapController _mapController;
  Set<Marker> _markers;

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
      floatingActionButton: MapPageOptionsWidget(),
      body: StreamBuilder<List<MinimumInfoUpdate>>(
          stream: _busDataBloc.busData,
          initialData: List<MinimumInfoUpdate>(),
          builder: (context, snapshot) {
            return Center(
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                    target: LatLng(49.218360, -2.139824), zoom: 11),
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
                markers:
                    snapshot.data.map((update) => buildMarker(update)).toSet(),
              ),
            );
          }),
    );
  }

  Marker buildMarker(MinimumInfoUpdate update) {
    return Marker(
      markerId: MarkerId(update.bus + update.direction),
      position: LatLng(update.lat, update.lon),
      infoWindow: InfoWindow(title: update.line, snippet: update.direction),
      rotation: update.bearing.toDouble(),
      anchor: Offset(0.5, 0.5),
    );
  }

  ListTile buildTile(String name) {
    return ListTile(title: Text(name));
  }
}