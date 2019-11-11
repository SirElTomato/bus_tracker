// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_stop.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BusStop> _$busStopSerializer = new _$BusStopSerializer();

class _$BusStopSerializer implements StructuredSerializer<BusStop> {
  @override
  final Iterable<Type> types = const [BusStop, _$BusStop];
  @override
  final String wireName = 'BusStop';

  @override
  Iterable serialize(Serializers serializers, BusStop object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'StopNumber',
      serializers.serialize(object.StopNumber,
          specifiedType: const FullType(int)),
      'StopName',
      serializers.serialize(object.StopName,
          specifiedType: const FullType(String)),
      'Latitude',
      serializers.serialize(object.Latitude,
          specifiedType: const FullType(double)),
      'Longitude',
      serializers.serialize(object.Longitude,
          specifiedType: const FullType(double)),
      'DistanceAwayInMetres',
      serializers.serialize(object.DistanceAwayInMetres,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  BusStop deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BusStopBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'StopNumber':
          result.StopNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'StopName':
          result.StopName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Latitude':
          result.Latitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'Longitude':
          result.Longitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'DistanceAwayInMetres':
          result.DistanceAwayInMetres = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$BusStop extends BusStop {
  @override
  final int StopNumber;
  @override
  final String StopName;
  @override
  final double Latitude;
  @override
  final double Longitude;
  @override
  final int DistanceAwayInMetres;

  factory _$BusStop([void updates(BusStopBuilder b)]) =>
      (new BusStopBuilder()..update(updates)).build();

  _$BusStop._(
      {this.StopNumber,
      this.StopName,
      this.Latitude,
      this.Longitude,
      this.DistanceAwayInMetres})
      : super._() {
    if (StopNumber == null) {
      throw new BuiltValueNullFieldError('BusStop', 'StopNumber');
    }
    if (StopName == null) {
      throw new BuiltValueNullFieldError('BusStop', 'StopName');
    }
    if (Latitude == null) {
      throw new BuiltValueNullFieldError('BusStop', 'Latitude');
    }
    if (Longitude == null) {
      throw new BuiltValueNullFieldError('BusStop', 'Longitude');
    }
    if (DistanceAwayInMetres == null) {
      throw new BuiltValueNullFieldError('BusStop', 'DistanceAwayInMetres');
    }
  }

  @override
  BusStop rebuild(void updates(BusStopBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BusStopBuilder toBuilder() => new BusStopBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BusStop &&
        StopNumber == other.StopNumber &&
        StopName == other.StopName &&
        Latitude == other.Latitude &&
        Longitude == other.Longitude &&
        DistanceAwayInMetres == other.DistanceAwayInMetres;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, StopNumber.hashCode), StopName.hashCode),
                Latitude.hashCode),
            Longitude.hashCode),
        DistanceAwayInMetres.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BusStop')
          ..add('StopNumber', StopNumber)
          ..add('StopName', StopName)
          ..add('Latitude', Latitude)
          ..add('Longitude', Longitude)
          ..add('DistanceAwayInMetres', DistanceAwayInMetres))
        .toString();
  }
}

class BusStopBuilder implements Builder<BusStop, BusStopBuilder> {
  _$BusStop _$v;

  int _StopNumber;
  int get StopNumber => _$this._StopNumber;
  set StopNumber(int StopNumber) => _$this._StopNumber = StopNumber;

  String _StopName;
  String get StopName => _$this._StopName;
  set StopName(String StopName) => _$this._StopName = StopName;

  double _Latitude;
  double get Latitude => _$this._Latitude;
  set Latitude(double Latitude) => _$this._Latitude = Latitude;

  double _Longitude;
  double get Longitude => _$this._Longitude;
  set Longitude(double Longitude) => _$this._Longitude = Longitude;

  int _DistanceAwayInMetres;
  int get DistanceAwayInMetres => _$this._DistanceAwayInMetres;
  set DistanceAwayInMetres(int DistanceAwayInMetres) =>
      _$this._DistanceAwayInMetres = DistanceAwayInMetres;

  BusStopBuilder();

  BusStopBuilder get _$this {
    if (_$v != null) {
      _StopNumber = _$v.StopNumber;
      _StopName = _$v.StopName;
      _Latitude = _$v.Latitude;
      _Longitude = _$v.Longitude;
      _DistanceAwayInMetres = _$v.DistanceAwayInMetres;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BusStop other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BusStop;
  }

  @override
  void update(void updates(BusStopBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$BusStop build() {
    final _$result = _$v ??
        new _$BusStop._(
            StopNumber: StopNumber,
            StopName: StopName,
            Latitude: Latitude,
            Longitude: Longitude,
            DistanceAwayInMetres: DistanceAwayInMetres);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
