// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RouteData extends RouteData {
  @override
  final BuiltList<BusRoute> busRoutes;

  factory _$RouteData([void updates(RouteDataBuilder b)]) =>
      (new RouteDataBuilder()..update(updates)).build();

  _$RouteData._({this.busRoutes}) : super._() {
    if (busRoutes == null) {
      throw new BuiltValueNullFieldError('RouteData', 'busRoutes');
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
    return other is RouteData && busRoutes == other.busRoutes;
  }

  @override
  int get hashCode {
    return $jf($jc(0, busRoutes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RouteData')
          ..add('busRoutes', busRoutes))
        .toString();
  }
}

class RouteDataBuilder implements Builder<RouteData, RouteDataBuilder> {
  _$RouteData _$v;

  ListBuilder<BusRoute> _busRoutes;
  ListBuilder<BusRoute> get busRoutes =>
      _$this._busRoutes ??= new ListBuilder<BusRoute>();
  set busRoutes(ListBuilder<BusRoute> busRoutes) =>
      _$this._busRoutes = busRoutes;

  RouteDataBuilder();

  RouteDataBuilder get _$this {
    if (_$v != null) {
      _busRoutes = _$v.busRoutes?.toBuilder();
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
      _$result = _$v ?? new _$RouteData._(busRoutes: busRoutes.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'busRoutes';
        busRoutes.build();
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
