// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RouteData> _$routeDataSerializer = new _$RouteDataSerializer();

class _$RouteDataSerializer implements StructuredSerializer<RouteData> {
  @override
  final Iterable<Type> types = const [RouteData, _$RouteData];
  @override
  final String wireName = 'RouteData';

  @override
  Iterable serialize(Serializers serializers, RouteData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'routes',
      serializers.serialize(object.routes,
          specifiedType:
              const FullType(BuiltList, const [const FullType(BusRoute)])),
    ];

    return result;
  }

  @override
  RouteData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RouteDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'routes':
          result.routes.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(BusRoute)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$RouteData extends RouteData {
  @override
  final BuiltList<BusRoute> routes;

  factory _$RouteData([void updates(RouteDataBuilder b)]) =>
      (new RouteDataBuilder()..update(updates)).build();

  _$RouteData._({this.routes}) : super._() {
    if (routes == null) {
      throw new BuiltValueNullFieldError('RouteData', 'routes');
    }
  }

  @override
  RouteData rebuild(void updates(RouteDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  RouteDataBuilder toBuilder() => new RouteDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RouteData && routes == other.routes;
  }

  @override
  int get hashCode {
    return $jf($jc(0, routes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RouteData')..add('routes', routes))
        .toString();
  }
}

class RouteDataBuilder implements Builder<RouteData, RouteDataBuilder> {
  _$RouteData _$v;

  ListBuilder<BusRoute> _routes;
  ListBuilder<BusRoute> get routes =>
      _$this._routes ??= new ListBuilder<BusRoute>();
  set routes(ListBuilder<BusRoute> routes) => _$this._routes = routes;

  RouteDataBuilder();

  RouteDataBuilder get _$this {
    if (_$v != null) {
      _routes = _$v.routes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RouteData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RouteData;
  }

  @override
  void update(void updates(RouteDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$RouteData build() {
    _$RouteData _$result;
    try {
      _$result = _$v ?? new _$RouteData._(routes: routes.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'routes';
        routes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RouteData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
