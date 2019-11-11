// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BusData> _$busDataSerializer = new _$BusDataSerializer();

class _$BusDataSerializer implements StructuredSerializer<BusData> {
  @override
  final Iterable<Type> types = const [BusData, _$BusData];
  @override
  final String wireName = 'BusData';

  @override
  Iterable serialize(Serializers serializers, BusData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'minimumInfoUpdates',
      serializers.serialize(object.minimumInfoUpdates,
          specifiedType: const FullType(
              BuiltList, const [const FullType(MinimumInfoUpdate)])),
      'busStops',
      serializers.serialize(object.busStops,
          specifiedType:
              const FullType(BuiltList, const [const FullType(BusStop)])),
    ];

    return result;
  }

  @override
  BusData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BusDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'minimumInfoUpdates':
          result.minimumInfoUpdates.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MinimumInfoUpdate)]))
              as BuiltList);
          break;
        case 'busStops':
          result.busStops.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(BusStop)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$BusData extends BusData {
  @override
  final BuiltList<MinimumInfoUpdate> minimumInfoUpdates;
  @override
  final BuiltList<BusStop> busStops;

  factory _$BusData([void updates(BusDataBuilder b)]) =>
      (new BusDataBuilder()..update(updates)).build();

  _$BusData._({this.minimumInfoUpdates, this.busStops}) : super._() {
    if (minimumInfoUpdates == null) {
      throw new BuiltValueNullFieldError('BusData', 'minimumInfoUpdates');
    }
    if (busStops == null) {
      throw new BuiltValueNullFieldError('BusData', 'busStops');
    }
  }

  @override
  BusData rebuild(void updates(BusDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BusDataBuilder toBuilder() => new BusDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BusData &&
        minimumInfoUpdates == other.minimumInfoUpdates &&
        busStops == other.busStops;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, minimumInfoUpdates.hashCode), busStops.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BusData')
          ..add('minimumInfoUpdates', minimumInfoUpdates)
          ..add('busStops', busStops))
        .toString();
  }
}

class BusDataBuilder implements Builder<BusData, BusDataBuilder> {
  _$BusData _$v;

  ListBuilder<MinimumInfoUpdate> _minimumInfoUpdates;
  ListBuilder<MinimumInfoUpdate> get minimumInfoUpdates =>
      _$this._minimumInfoUpdates ??= new ListBuilder<MinimumInfoUpdate>();
  set minimumInfoUpdates(ListBuilder<MinimumInfoUpdate> minimumInfoUpdates) =>
      _$this._minimumInfoUpdates = minimumInfoUpdates;

  ListBuilder<BusStop> _busStops;
  ListBuilder<BusStop> get busStops =>
      _$this._busStops ??= new ListBuilder<BusStop>();
  set busStops(ListBuilder<BusStop> busStops) => _$this._busStops = busStops;

  BusDataBuilder();

  BusDataBuilder get _$this {
    if (_$v != null) {
      _minimumInfoUpdates = _$v.minimumInfoUpdates?.toBuilder();
      _busStops = _$v.busStops?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BusData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BusData;
  }

  @override
  void update(void updates(BusDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$BusData build() {
    _$BusData _$result;
    try {
      _$result = _$v ??
          new _$BusData._(
              minimumInfoUpdates: minimumInfoUpdates.build(),
              busStops: busStops.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'minimumInfoUpdates';
        minimumInfoUpdates.build();
        _$failedField = 'busStops';
        busStops.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BusData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
