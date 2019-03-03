// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_route.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BusRoute extends BusRoute {
  @override
  final int id;
  @override
  final String number;
  @override
  final String name;
  @override
  final String colour;
  @override
  final String colourInverse;
  @override
  final BuiltList<RouteCoordinates> routeCoordinates;
  @override
  final bool active;

  factory _$BusRoute([void updates(BusRouteBuilder b)]) =>
      (new BusRouteBuilder()..update(updates)).build();

  _$BusRoute._(
      {this.id,
      this.number,
      this.name,
      this.colour,
      this.colourInverse,
      this.routeCoordinates,
      this.active})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'id');
    }
    if (number == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'number');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'name');
    }
    if (colour == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'colour');
    }
    if (colourInverse == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'colourInverse');
    }
    if (routeCoordinates == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'routeCoordinates');
    }
    if (active == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'active');
    }
  }

  @override
  BusRoute rebuild(void updates(BusRouteBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BusRouteBuilder toBuilder() => new BusRouteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BusRoute &&
        id == other.id &&
        number == other.number &&
        name == other.name &&
        colour == other.colour &&
        colourInverse == other.colourInverse &&
        routeCoordinates == other.routeCoordinates &&
        active == other.active;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), number.hashCode),
                        name.hashCode),
                    colour.hashCode),
                colourInverse.hashCode),
            routeCoordinates.hashCode),
        active.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BusRoute')
          ..add('id', id)
          ..add('number', number)
          ..add('name', name)
          ..add('colour', colour)
          ..add('colourInverse', colourInverse)
          ..add('routeCoordinates', routeCoordinates)
          ..add('active', active))
        .toString();
  }
}

class BusRouteBuilder implements Builder<BusRoute, BusRouteBuilder> {
  _$BusRoute _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _number;
  String get number => _$this._number;
  set number(String number) => _$this._number = number;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _colour;
  String get colour => _$this._colour;
  set colour(String colour) => _$this._colour = colour;

  String _colourInverse;
  String get colourInverse => _$this._colourInverse;
  set colourInverse(String colourInverse) =>
      _$this._colourInverse = colourInverse;

  ListBuilder<RouteCoordinates> _routeCoordinates;
  ListBuilder<RouteCoordinates> get routeCoordinates =>
      _$this._routeCoordinates ??= new ListBuilder<RouteCoordinates>();
  set routeCoordinates(ListBuilder<RouteCoordinates> routeCoordinates) =>
      _$this._routeCoordinates = routeCoordinates;

  bool _active;
  bool get active => _$this._active;
  set active(bool active) => _$this._active = active;

  BusRouteBuilder();

  BusRouteBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _number = _$v.number;
      _name = _$v.name;
      _colour = _$v.colour;
      _colourInverse = _$v.colourInverse;
      _routeCoordinates = _$v.routeCoordinates?.toBuilder();
      _active = _$v.active;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BusRoute other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BusRoute;
  }

  @override
  void update(void updates(BusRouteBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$BusRoute build() {
    _$BusRoute _$result;
    try {
      _$result = _$v ??
          new _$BusRoute._(
              id: id,
              number: number,
              name: name,
              colour: colour,
              colourInverse: colourInverse,
              routeCoordinates: routeCoordinates.build(),
              active: active);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'routeCoordinates';
        routeCoordinates.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BusRoute', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
