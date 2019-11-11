// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_coordinates.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RouteCoordinates> _$routeCoordinatesSerializer =
    new _$RouteCoordinatesSerializer();

class _$RouteCoordinatesSerializer
    implements StructuredSerializer<RouteCoordinates> {
  @override
  final Iterable<Type> types = const [RouteCoordinates, _$RouteCoordinates];
  @override
  final String wireName = 'RouteCoordinates';

  @override
  Iterable serialize(Serializers serializers, RouteCoordinates object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'lat',
      serializers.serialize(object.lat, specifiedType: const FullType(double)),
      'lon',
      serializers.serialize(object.lon, specifiedType: const FullType(double)),
      'isVital',
      serializers.serialize(object.isVital,
          specifiedType: const FullType(bool)),
      'occasional',
      serializers.serialize(object.occasional,
          specifiedType: const FullType(bool)),
      'direction',
      serializers.serialize(object.direction,
          specifiedType: const FullType(String)),
    ];
    if (object.splitSection != null) {
      result
        ..add('splitSection')
        ..add(serializers.serialize(object.splitSection,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  RouteCoordinates deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RouteCoordinatesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'lat':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'lon':
          result.lon = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'isVital':
          result.isVital = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'occasional':
          result.occasional = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'direction':
          result.direction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'splitSection':
          result.splitSection = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RouteCoordinates extends RouteCoordinates {
  @override
  final double lat;
  @override
  final double lon;
  @override
  final bool isVital;
  @override
  final bool occasional;
  @override
  final String direction;
  @override
  final String splitSection;

  factory _$RouteCoordinates([void updates(RouteCoordinatesBuilder b)]) =>
      (new RouteCoordinatesBuilder()..update(updates)).build();

  _$RouteCoordinates._(
      {this.lat,
      this.lon,
      this.isVital,
      this.occasional,
      this.direction,
      this.splitSection})
      : super._() {
    if (lat == null) {
      throw new BuiltValueNullFieldError('RouteCoordinates', 'lat');
    }
    if (lon == null) {
      throw new BuiltValueNullFieldError('RouteCoordinates', 'lon');
    }
    if (isVital == null) {
      throw new BuiltValueNullFieldError('RouteCoordinates', 'isVital');
    }
    if (occasional == null) {
      throw new BuiltValueNullFieldError('RouteCoordinates', 'occasional');
    }
    if (direction == null) {
      throw new BuiltValueNullFieldError('RouteCoordinates', 'direction');
    }
  }

  @override
  RouteCoordinates rebuild(void updates(RouteCoordinatesBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  RouteCoordinatesBuilder toBuilder() =>
      new RouteCoordinatesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RouteCoordinates &&
        lat == other.lat &&
        lon == other.lon &&
        isVital == other.isVital &&
        occasional == other.occasional &&
        direction == other.direction &&
        splitSection == other.splitSection;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, lat.hashCode), lon.hashCode), isVital.hashCode),
                occasional.hashCode),
            direction.hashCode),
        splitSection.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RouteCoordinates')
          ..add('lat', lat)
          ..add('lon', lon)
          ..add('isVital', isVital)
          ..add('occasional', occasional)
          ..add('direction', direction)
          ..add('splitSection', splitSection))
        .toString();
  }
}

class RouteCoordinatesBuilder
    implements Builder<RouteCoordinates, RouteCoordinatesBuilder> {
  _$RouteCoordinates _$v;

  double _lat;
  double get lat => _$this._lat;
  set lat(double lat) => _$this._lat = lat;

  double _lon;
  double get lon => _$this._lon;
  set lon(double lon) => _$this._lon = lon;

  bool _isVital;
  bool get isVital => _$this._isVital;
  set isVital(bool isVital) => _$this._isVital = isVital;

  bool _occasional;
  bool get occasional => _$this._occasional;
  set occasional(bool occasional) => _$this._occasional = occasional;

  String _direction;
  String get direction => _$this._direction;
  set direction(String direction) => _$this._direction = direction;

  String _splitSection;
  String get splitSection => _$this._splitSection;
  set splitSection(String splitSection) => _$this._splitSection = splitSection;

  RouteCoordinatesBuilder();

  RouteCoordinatesBuilder get _$this {
    if (_$v != null) {
      _lat = _$v.lat;
      _lon = _$v.lon;
      _isVital = _$v.isVital;
      _occasional = _$v.occasional;
      _direction = _$v.direction;
      _splitSection = _$v.splitSection;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RouteCoordinates other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RouteCoordinates;
  }

  @override
  void update(void updates(RouteCoordinatesBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$RouteCoordinates build() {
    final _$result = _$v ??
        new _$RouteCoordinates._(
            lat: lat,
            lon: lon,
            isVital: isVital,
            occasional: occasional,
            direction: direction,
            splitSection: splitSection);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
