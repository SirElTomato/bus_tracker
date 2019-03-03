// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_stop.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BusStop extends BusStop {
  @override
  final int stopNumber;
  @override
  final String stopName;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int distanceAwayInMetres;

  factory _$BusStop([void updates(BusStopBuilder b)]) =>
      (new BusStopBuilder()..update(updates)).build();

  _$BusStop._(
      {this.stopNumber,
      this.stopName,
      this.latitude,
      this.longitude,
      this.distanceAwayInMetres})
      : super._() {
    if (stopNumber == null) {
      throw new BuiltValueNullFieldError('BusStop', 'stopNumber');
    }
    if (stopName == null) {
      throw new BuiltValueNullFieldError('BusStop', 'stopName');
    }
    if (latitude == null) {
      throw new BuiltValueNullFieldError('BusStop', 'latitude');
    }
    if (longitude == null) {
      throw new BuiltValueNullFieldError('BusStop', 'longitude');
    }
    if (distanceAwayInMetres == null) {
      throw new BuiltValueNullFieldError('BusStop', 'distanceAwayInMetres');
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
        stopNumber == other.stopNumber &&
        stopName == other.stopName &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        distanceAwayInMetres == other.distanceAwayInMetres;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, stopNumber.hashCode), stopName.hashCode),
                latitude.hashCode),
            longitude.hashCode),
        distanceAwayInMetres.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BusStop')
          ..add('stopNumber', stopNumber)
          ..add('stopName', stopName)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('distanceAwayInMetres', distanceAwayInMetres))
        .toString();
  }
}

class BusStopBuilder implements Builder<BusStop, BusStopBuilder> {
  _$BusStop _$v;

  int _stopNumber;
  int get stopNumber => _$this._stopNumber;
  set stopNumber(int stopNumber) => _$this._stopNumber = stopNumber;

  String _stopName;
  String get stopName => _$this._stopName;
  set stopName(String stopName) => _$this._stopName = stopName;

  double _latitude;
  double get latitude => _$this._latitude;
  set latitude(double latitude) => _$this._latitude = latitude;

  double _longitude;
  double get longitude => _$this._longitude;
  set longitude(double longitude) => _$this._longitude = longitude;

  int _distanceAwayInMetres;
  int get distanceAwayInMetres => _$this._distanceAwayInMetres;
  set distanceAwayInMetres(int distanceAwayInMetres) =>
      _$this._distanceAwayInMetres = distanceAwayInMetres;

  BusStopBuilder();

  BusStopBuilder get _$this {
    if (_$v != null) {
      _stopNumber = _$v.stopNumber;
      _stopName = _$v.stopName;
      _latitude = _$v.latitude;
      _longitude = _$v.longitude;
      _distanceAwayInMetres = _$v.distanceAwayInMetres;
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
            stopNumber: stopNumber,
            stopName: stopName,
            latitude: latitude,
            longitude: longitude,
            distanceAwayInMetres: distanceAwayInMetres);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
