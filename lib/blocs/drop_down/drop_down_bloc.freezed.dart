// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drop_down_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DropDownState {
  String get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DropDownStateCopyWith<DropDownState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DropDownStateCopyWith<$Res> {
  factory $DropDownStateCopyWith(
          DropDownState value, $Res Function(DropDownState) then) =
      _$DropDownStateCopyWithImpl<$Res, DropDownState>;
  @useResult
  $Res call({String state});
}

/// @nodoc
class _$DropDownStateCopyWithImpl<$Res, $Val extends DropDownState>
    implements $DropDownStateCopyWith<$Res> {
  _$DropDownStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DropDownStateImplCopyWith<$Res>
    implements $DropDownStateCopyWith<$Res> {
  factory _$$DropDownStateImplCopyWith(
          _$DropDownStateImpl value, $Res Function(_$DropDownStateImpl) then) =
      __$$DropDownStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String state});
}

/// @nodoc
class __$$DropDownStateImplCopyWithImpl<$Res>
    extends _$DropDownStateCopyWithImpl<$Res, _$DropDownStateImpl>
    implements _$$DropDownStateImplCopyWith<$Res> {
  __$$DropDownStateImplCopyWithImpl(
      _$DropDownStateImpl _value, $Res Function(_$DropDownStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$DropDownStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DropDownStateImpl implements _DropDownState {
  const _$DropDownStateImpl({this.state = 'normal order'});

  @override
  @JsonKey()
  final String state;

  @override
  String toString() {
    return 'DropDownState(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DropDownStateImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DropDownStateImplCopyWith<_$DropDownStateImpl> get copyWith =>
      __$$DropDownStateImplCopyWithImpl<_$DropDownStateImpl>(this, _$identity);
}

abstract class _DropDownState implements DropDownState {
  const factory _DropDownState({final String state}) = _$DropDownStateImpl;

  @override
  String get state;
  @override
  @JsonKey(ignore: true)
  _$$DropDownStateImplCopyWith<_$DropDownStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
