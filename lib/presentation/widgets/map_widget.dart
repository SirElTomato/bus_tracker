import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:track_my_travel/blocs/bus_data/bus_data_bloc.dart';
import 'package:track_my_travel/blocs/preferences/preferences_bloc.dart';
import 'package:track_my_travel/blocs/preferences/preferences_state.dart';
import 'package:track_my_travel/data/models/bus_data/minimum_info_update.dart';

class MapWidget extends StatefulWidget {
  final BusDataBloc busDataBloc;
  final PreferencesBloc preferencesBloc;

  MapWidget(this.busDataBloc, this.preferencesBloc);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController _mapController;
  List<String> selectedRoutes = ['1', '15', '22'];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MinimumInfoUpdate>>(
      stream: widget.busDataBloc.busData,
      initialData: List<MinimumInfoUpdate>(),
      builder: (context, snapshot) {
        List<MinimumInfoUpdate> updates = snapshot.data;
        return StreamBuilder<PreferencesState>(
            stream: widget.preferencesBloc.currentPreferences,
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
                    markers: updates
                        .where((update) =>
                            snapshot.data.selectedRoutes.contains(update.line))
                        .map((update) => buildMarker(update))
                        .toSet()),
              );
            });
      },
    );
  }

  Marker buildMarker(MinimumInfoUpdate update) {
    return Marker(
      markerId: MarkerId(update.bus + update.direction),
      position: LatLng(update.lat, update.lon),
      infoWindow: InfoWindow(title: update.line, snippet: update.direction),
      rotation: update.bearing.toDouble(),
      anchor: Offset(0.5, 0.5),
      icon: BitmapDescriptor.fromAsset(
          "assets/bus_markers/150/${update.line}.png"),
    );
  }
}
