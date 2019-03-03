// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(BusData.serializer)
      ..add(BusRoute.serializer)
      ..add(BusStop.serializer)
      ..add(MinimumInfoUpdate.serializer)
      ..add(RouteCoordinates.serializer)
      ..add(RouteData.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(BusRoute)]),
          () => new ListBuilder<BusRoute>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(MinimumInfoUpdate)]),
          () => new ListBuilder<MinimumInfoUpdate>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(BusStop)]),
          () => new ListBuilder<BusStop>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(RouteCoordinates)]),
          () => new ListBuilder<RouteCoordinates>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
