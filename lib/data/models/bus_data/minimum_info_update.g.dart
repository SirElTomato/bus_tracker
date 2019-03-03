// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimum_info_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MinimumInfoUpdate> _$minimumInfoUpdateSerializer =
    new _$MinimumInfoUpdateSerializer();

class _$MinimumInfoUpdateSerializer
    implements StructuredSerializer<MinimumInfoUpdate> {
  @override
  final Iterable<Type> types = const [MinimumInfoUpdate, _$MinimumInfoUpdate];
  @override
  final String wireName = 'MinimumInfoUpdate';

  @override
  Iterable serialize(Serializers serializers, MinimumInfoUpdate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'bus',
      serializers.serialize(object.bus, specifiedType: const FullType(String)),
      'line',
      serializers.serialize(object.line, specifiedType: const FullType(String)),
      'cat',
      serializers.serialize(object.cat, specifiedType: const FullType(String)),
      'lat',
      serializers.serialize(object.lat, specifiedType: const FullType(double)),
      'lon',
      serializers.serialize(object.lon, specifiedType: const FullType(double)),
      'bearing',
      serializers.serialize(object.bearing, specifiedType: const FullType(int)),
      'direction',
      serializers.serialize(object.direction,
          specifiedType: const FullType(String)),
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(String)),
      'age',
      serializers.serialize(object.age, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  MinimumInfoUpdate deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MinimumInfoUpdateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'bus':
          result.bus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'line':
          result.line = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cat':
          result.cat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lat':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'lon':
          result.lon = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'bearing':
          result.bearing = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'direction':
          result.direction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

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
