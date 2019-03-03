import 'package:built_value/built_value.dart';

part 'bus_stop.g.dart';

abstract class BusStop implements Built<BusStop, BusStopBuilder> {
  int get stopNumber;
  String get stopName;
  double get latitude;
  double get longitude;
  int get distanceAwayInMetres;

  BusStop._();

  factory BusStop([updates(BusStopBuilder b)]) = _$BusStop;
}
