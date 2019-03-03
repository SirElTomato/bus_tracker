// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimum_info_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MinimumInfoUpdate extends MinimumInfoUpdate {
  @override
  final String bus;
  @override
  final String line;
  @override
  final String cat;
  @override
  final double lat;
  @override
  final double lon;
  @override
  final int bearing;
  @override
  final String direction;
  @override
  final String time;
  @override
  final int age;

  factory _$MinimumInfoUpdate([void updates(MinimumInfoUpdateBuilder b)]) =>
      (new MinimumInfoUpdateBuilder()..update(updates)).build();

  _$MinimumInfoUpdate._(
      {this.bus,
      this.line,
      this.cat,
      this.lat,
      this.lon,
      this.bearing,
      this.direction,
      this.time,
      this.age})
      : super._() {
    if (bus == null) {
      throw new BuiltValueNullFieldError('MinimumInfoUpdate', 'bus');
    }
    if (line == null) {
      throw new BuiltValueNullFieldError('MinimumInfoUpdate', 'line');
    }
    if (cat == null) {
      throw new BuiltValueNullFieldError('MinimumInfoUpdate', 'cat');
    }
    if (lat == null) {
      throw new BuiltValueNullFieldError('MinimumInfoUpdate', 'lat');
    }
    if (lon == null) {
      throw new BuiltValueNullFieldError('MinimumInfoUpdate', 'lon');
    }
    if (bearing == null) {
      throw new BuiltValueNullFieldError('MinimumInfoUpdate', 'bearing');
    }
    if (direction == null) {
      throw new BuiltValueNullFieldError('MinimumInfoUpdate', 'direction');
    }
    if (time == null) {
      throw new BuiltValueNullFieldError('MinimumInfoUpdate', 'time');
    }
    if (age == null) {
      throw new BuiltValueNullFieldError('MinimumInfoUpdate', 'age');
    }
  }

  @override
  MinimumInfoUpdate rebuild(void updates(MinimumInfoUpdateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MinimumInfoUpdateBuilder toBuilder() =>
      new MinimumInfoUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MinimumInfoUpdate &&
        bus == other.bus &&
        line == other.line &&
        cat == other.cat &&
        lat == other.lat &&
        lon == other.lon &&
        bearing == other.bearing &&
        direction == other.direction &&
        time == other.time &&
        age == other.age;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, bus.hashCode), line.hashCode),
                                cat.hashCode),
                            lat.hashCode),
                        lon.hashCode),
                    bearing.hashCode),
                direction.hashCode),
            time.hashCode),
        age.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MinimumInfoUpdate')
          ..add('bus', bus)
          ..add('line', line)
          ..add('cat', cat)
          ..add('lat', lat)
          ..add('lon', lon)
          ..add('bearing', bearing)
          ..add('direction', direction)
          ..add('time', time)
          ..add('age', age))
        .toString();
  }
}

class MinimumInfoUpdateBuilder
    implements Builder<MinimumInfoUpdate, MinimumInfoUpdateBuilder> {
  _$MinimumInfoUpdate _$v;

  String _bus;
  String get bus => _$this._bus;
  set bus(String bus) => _$this._bus = bus;

  String _line;
  String get line => _$this._line;
  set line(String line) => _$this._line = line;

  String _cat;
  String get cat => _$this._cat;
  set cat(String cat) => _$this._cat = cat;

  double _lat;
  double get lat => _$this._lat;
  set lat(double lat) => _$this._lat = lat;

  double _lon;
  double get lon => _$this._lon;
  set lon(double lon) => _$this._lon = lon;

  int _bearing;
  int get bearing => _$this._bearing;
  set bearing(int bearing) => _$this._bearing = bearing;

  String _direction;
  String get direction => _$this._direction;
  set direction(String direction) => _$this._direction = direction;

  String _time;
  String get time => _$this._time;
  set time(String time) => _$this._time = time;

  int _age;
  int get age => _$this._age;
  set age(int age) => _$this._age = age;

  MinimumInfoUpdateBuilder();

  MinimumInfoUpdateBuilder get _$this {
    if (_$v != null) {
      _bus = _$v.bus;
      _line = _$v.line;
      _cat = _$v.cat;
      _lat = _$v.lat;
      _lon = _$v.lon;
      _bearing = _$v.bearing;
      _direction = _$v.direction;
      _time = _$v.time;
      _age = _$v.age;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MinimumInfoUpdate other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MinimumInfoUpdate;
  }

  @override
  void update(void updates(MinimumInfoUpdateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MinimumInfoUpdate build() {
    final _$result = _$v ??
        new _$MinimumInfoUpdate._(
            bus: bus,
            line: line,
            cat: cat,
            lat: lat,
            lon: lon,
            bearing: bearing,
            direction: direction,
            time: time,
            age: age);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
