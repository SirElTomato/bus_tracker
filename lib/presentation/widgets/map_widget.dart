import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Completer<GoogleMapController> _mapController = Completer();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
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
    );
  }
}
