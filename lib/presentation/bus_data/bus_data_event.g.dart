// GENERATED CODE - DO NOT MODIFY BY HAND

part of bus_data_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetBusData extends GetBusData {
  factory _$GetBusData([void updates(GetBusDataBuilder b)]) =>
      (new GetBusDataBuilder()..update(updates)).build();

  _$GetBusData._() : super._();

  @override
  GetBusData rebuild(void updates(GetBusDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GetBusDataBuilder toBuilder() => new GetBusDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetBusData;
  }

  @override
  int get hashCode {
    return 1030689428;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetBusData').toString();
  }
}

class GetBusDataBuilder implements Builder<GetBusData, GetBusDataBuilder> {
  _$GetBusData _$v;

  GetBusDataBuilder();

  @override
  void replace(GetBusData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GetBusData;
  }

  @override
  void update(void updates(GetBusDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GetBusData build() {
    final _$result = _$v ?? new _$GetBusData._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
