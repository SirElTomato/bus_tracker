// GENERATED CODE - DO NOT MODIFY BY HAND

part of bus_data_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BusDataState extends BusDataState {
  @override
  final BuiltList<MinimumInfoUpdate> minimumInfoUpdates;
  @override
  final String error;

  factory _$BusDataState([void updates(BusDataStateBuilder b)]) =>
      (new BusDataStateBuilder()..update(updates)).build();

  _$BusDataState._({this.minimumInfoUpdates, this.error}) : super._() {
    if (minimumInfoUpdates == null) {
      throw new BuiltValueNullFieldError('BusDataState', 'minimumInfoUpdates');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('BusDataState', 'error');
    }
  }

  @override
  BusDataState rebuild(void updates(BusDataStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BusDataStateBuilder toBuilder() => new BusDataStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BusDataState &&
        minimumInfoUpdates == other.minimumInfoUpdates &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, minimumInfoUpdates.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BusDataState')
          ..add('minimumInfoUpdates', minimumInfoUpdates)
          ..add('error', error))
        .toString();
  }
}

class BusDataStateBuilder
    implements Builder<BusDataState, BusDataStateBuilder> {
  _$BusDataState _$v;

  ListBuilder<MinimumInfoUpdate> _minimumInfoUpdates;
  ListBuilder<MinimumInfoUpdate> get minimumInfoUpdates =>
      _$this._minimumInfoUpdates ??= new ListBuilder<MinimumInfoUpdate>();
  set minimumInfoUpdates(ListBuilder<MinimumInfoUpdate> minimumInfoUpdates) =>
      _$this._minimumInfoUpdates = minimumInfoUpdates;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  BusDataStateBuilder();

  BusDataStateBuilder get _$this {
    if (_$v != null) {
      _minimumInfoUpdates = _$v.minimumInfoUpdates?.toBuilder();
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BusDataState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BusDataState;
  }

  @override
  void update(void updates(BusDataStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$BusDataState build() {
    _$BusDataState _$result;
    try {
      _$result = _$v ??
          new _$BusDataState._(
              minimumInfoUpdates: minimumInfoUpdates.build(), error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'minimumInfoUpdates';
        minimumInfoUpdates.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BusDataState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
