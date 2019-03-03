// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_route.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BusRoute> _$busRouteSerializer = new _$BusRouteSerializer();

class _$BusRouteSerializer implements StructuredSerializer<BusRoute> {
  @override
  final Iterable<Type> types = const [BusRoute, _$BusRoute];
  @override
  final String wireName = 'BusRoute';

  @override
  Iterable serialize(Serializers serializers, BusRoute object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'Id',
      serializers.serialize(object.Id, specifiedType: const FullType(int)),
      'Number',
      serializers.serialize(object.Number,
          specifiedType: const FullType(String)),
      'Name',
      serializers.serialize(object.Name, specifiedType: const FullType(String)),
      'Colour',
      serializers.serialize(object.Colour,
          specifiedType: const FullType(String)),
      'ColourInverse',
      serializers.serialize(object.ColourInverse,
          specifiedType: const FullType(String)),
      'RouteCoordinates',
      serializers.serialize(object.RouteCoordinates,
          specifiedType: const FullType(
              BuiltList, const [const FullType(RC.RouteCoordinates)])),
      'Active',
      serializers.serialize(object.Active, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  BusRoute deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BusRouteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'Id':
          result.Id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Number':
          result.Number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Name':
          result.Name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Colour':
          result.Colour = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ColourInverse':
          result.ColourInverse = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'RouteCoordinates':
          result.RouteCoordinates.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(RC.RouteCoordinates)]))
              as BuiltList);
          break;
        case 'Active':
          result.Active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$BusRoute extends BusRoute {
  @override
  final int Id;
  @override
  final String Number;
  @override
  final String Name;
  @override
  final String Colour;
  @override
  final String ColourInverse;
  @override
  final BuiltList<RC.RouteCoordinates> RouteCoordinates;
  @override
  final bool Active;

  factory _$BusRoute([void updates(BusRouteBuilder b)]) =>
      (new BusRouteBuilder()..update(updates)).build();

  _$BusRoute._(
      {this.Id,
      this.Number,
      this.Name,
      this.Colour,
      this.ColourInverse,
      this.RouteCoordinates,
      this.Active})
      : super._() {
    if (Id == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'Id');
    }
    if (Number == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'Number');
    }
    if (Name == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'Name');
    }
    if (Colour == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'Colour');
    }
    if (ColourInverse == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'ColourInverse');
    }
    if (RouteCoordinates == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'RouteCoordinates');
    }
    if (Active == null) {
      throw new BuiltValueNullFieldError('BusRoute', 'Active');
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
        Id == other.Id &&
        Number == other.Number &&
        Name == other.Name &&
        Colour == other.Colour &&
        ColourInverse == other.ColourInverse &&
        RouteCoordinates == other.RouteCoordinates &&
        Active == other.Active;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, Id.hashCode), Number.hashCode),
                        Name.hashCode),
                    Colour.hashCode),
                ColourInverse.hashCode),
            RouteCoordinates.hashCode),
        Active.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BusRoute')
          ..add('Id', Id)
          ..add('Number', Number)
          ..add('Name', Name)
          ..add('Colour', Colour)
          ..add('ColourInverse', ColourInverse)
          ..add('RouteCoordinates', RouteCoordinates)
          ..add('Active', Active))
        .toString();
  }
}

class BusRouteBuilder implements Builder<BusRoute, BusRouteBuilder> {
  _$BusRoute _$v;

  int _Id;
  int get Id => _$this._Id;
  set Id(int Id) => _$this._Id = Id;

  String _Number;
  String get Number => _$this._Number;
  set Number(String Number) => _$this._Number = Number;

  String _Name;
  String get Name => _$this._Name;
  set Name(String Name) => _$this._Name = Name;

  String _Colour;
  String get Colour => _$this._Colour;
  set Colour(String Colour) => _$this._Colour = Colour;

  String _ColourInverse;
  String get ColourInverse => _$this._ColourInverse;
  set ColourInverse(String ColourInverse) =>
      _$this._ColourInverse = ColourInverse;

  ListBuilder<RC.RouteCoordinates> _RouteCoordinates;
  ListBuilder<RC.RouteCoordinates> get RouteCoordinates =>
      _$this._RouteCoordinates ??= new ListBuilder<RC.RouteCoordinates>();
  set RouteCoordinates(ListBuilder<RC.RouteCoordinates> RouteCoordinates) =>
      _$this._RouteCoordinates = RouteCoordinates;

  bool _Active;
  bool get Active => _$this._Active;
  set Active(bool Active) => _$this._Active = Active;

  BusRouteBuilder();

  BusRouteBuilder get _$this {
    if (_$v != null) {
      _Id = _$v.Id;
      _Number = _$v.Number;
      _Name = _$v.Name;
      _Colour = _$v.Colour;
      _ColourInverse = _$v.ColourInverse;
      _RouteCoordinates = _$v.RouteCoordinates?.toBuilder();
      _Active = _$v.Active;
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
              Id: Id,
              Number: Number,
              Name: Name,
              Colour: Colour,
              ColourInverse: ColourInverse,
              RouteCoordinates: RouteCoordinates.build(),
              Active: Active);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'RouteCoordinates';
        RouteCoordinates.build();
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
