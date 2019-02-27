library bus_data_event;

import 'package:built_value/built_value.dart';

part 'bus_data_event.g.dart';

abstract class BusDataEvent {}

abstract class GetBusData extends BusDataEvent
    implements Built<GetBusData, GetBusDataBuilder> {
  // fields go here

  GetBusData._();

  factory GetBusData([updates(GetBusDataBuilder b)]) = _$GetBusData;
}
