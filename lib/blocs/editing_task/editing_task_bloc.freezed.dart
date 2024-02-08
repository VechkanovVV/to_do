// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editing_task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditingTaskState {
  String get title => throw _privateConstructorUsedError;
  bool get isRed => throw _privateConstructorUsedError;
  bool get isGreen => throw _privateConstructorUsedError;
  bool get isYellow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditingTaskStateCopyWith<EditingTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditingTaskStateCopyWith<$Res> {
  factory $EditingTaskStateCopyWith(
          EditingTaskState value, $Res Function(EditingTaskState) then) =
      _$EditingTaskStateCopyWithImpl<$Res, EditingTaskState>;
  @useResult
  $Res call({String title, bool isRed, bool isGreen, bool isYellow});
}

/// @nodoc
class _$EditingTaskStateCopyWithImpl<$Res, $Val extends EditingTaskState>
    implements $EditingTaskStateCopyWith<$Res> {
  _$EditingTaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isRed = null,
    Object? isGreen = null,
    Object? isYellow = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isRed: null == isRed
          ? _value.isRed
          : isRed // ignore: cast_nullable_to_non_nullable
              as bool,
      isGreen: null == isGreen
          ? _value.isGreen
          : isGreen // ignore: cast_nullable_to_non_nullable
              as bool,
      isYellow: null == isYellow
          ? _value.isYellow
          : isYellow // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditingTaskStateImplCopyWith<$Res>
    implements $EditingTaskStateCopyWith<$Res> {
  factory _$$EditingTaskStateImplCopyWith(_$EditingTaskStateImpl value,
          $Res Function(_$EditingTaskStateImpl) then) =
      __$$EditingTaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, bool isRed, bool isGreen, bool isYellow});
}

/// @nodoc
class __$$EditingTaskStateImplCopyWithImpl<$Res>
    extends _$EditingTaskStateCopyWithImpl<$Res, _$EditingTaskStateImpl>
    implements _$$EditingTaskStateImplCopyWith<$Res> {
  __$$EditingTaskStateImplCopyWithImpl(_$EditingTaskStateImpl _value,
      $Res Function(_$EditingTaskStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isRed = null,
    Object? isGreen = null,
    Object? isYellow = null,
  }) {
    return _then(_$EditingTaskStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isRed: null == isRed
          ? _value.isRed
          : isRed // ignore: cast_nullable_to_non_nullable
              as bool,
      isGreen: null == isGreen
          ? _value.isGreen
          : isGreen // ignore: cast_nullable_to_non_nullable
              as bool,
      isYellow: null == isYellow
          ? _value.isYellow
          : isYellow // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditingTaskStateImpl implements _EditingTaskState {
  const _$EditingTaskStateImpl(
      {this.title = '',
      this.isRed = false,
      this.isGreen = false,
      this.isYellow = false});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final bool isRed;
  @override
  @JsonKey()
  final bool isGreen;
  @override
  @JsonKey()
  final bool isYellow;

  @override
  String toString() {
    return 'EditingTaskState(title: $title, isRed: $isRed, isGreen: $isGreen, isYellow: $isYellow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditingTaskStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isRed, isRed) || other.isRed == isRed) &&
            (identical(other.isGreen, isGreen) || other.isGreen == isGreen) &&
            (identical(other.isYellow, isYellow) ||
                other.isYellow == isYellow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, isRed, isGreen, isYellow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditingTaskStateImplCopyWith<_$EditingTaskStateImpl> get copyWith =>
      __$$EditingTaskStateImplCopyWithImpl<_$EditingTaskStateImpl>(
          this, _$identity);
}

abstract class _EditingTaskState implements EditingTaskState {
  const factory _EditingTaskState(
      {final String title,
      final bool isRed,
      final bool isGreen,
      final bool isYellow}) = _$EditingTaskStateImpl;

  @override
  String get title;
  @override
  bool get isRed;
  @override
  bool get isGreen;
  @override
  bool get isYellow;
  @override
  @JsonKey(ignore: true)
  _$$EditingTaskStateImplCopyWith<_$EditingTaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
