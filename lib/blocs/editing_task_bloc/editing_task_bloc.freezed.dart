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
  String get description => throw _privateConstructorUsedError;
  dynamic get priority => throw _privateConstructorUsedError;

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
  $Res call({String title, String description, dynamic priority});
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
    Object? description = null,
    Object? priority = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
  $Res call({String title, String description, dynamic priority});
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
    Object? description = null,
    Object? priority = freezed,
  }) {
    return _then(_$EditingTaskStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority ? _value.priority! : priority,
    ));
  }
}

/// @nodoc

class _$EditingTaskStateImpl implements _EditingTaskState {
  const _$EditingTaskStateImpl(
      {this.title = '',
      this.description = '',
      this.priority = PriorityState.none});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final dynamic priority;

  @override
  String toString() {
    return 'EditingTaskState(title: $title, description: $description, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditingTaskStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.priority, priority));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      const DeepCollectionEquality().hash(priority));

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
      final String description,
      final dynamic priority}) = _$EditingTaskStateImpl;

  @override
  String get title;
  @override
  String get description;
  @override
  dynamic get priority;
  @override
  @JsonKey(ignore: true)
  _$$EditingTaskStateImplCopyWith<_$EditingTaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
