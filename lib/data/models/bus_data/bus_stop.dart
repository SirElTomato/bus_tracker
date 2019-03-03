import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bus_stop.g.dart';

abstract class BusStop implements Built<BusStop, BusStopBuilder> {
  static Serializer<BusStop> get serializer => _$busStopSerializer;

  int get StopNumber;
  String get StopName;
  double get Latitude;
  double get Longitude;
  int get DistanceAwayInMetres;

  BusStop._();

  factory BusStop([updates(BusStopBuilder b)]) = _$BusStop;
}
