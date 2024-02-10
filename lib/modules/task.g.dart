// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      title: json['title'] as String,
      isDone: json['isDone'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      isFavourite: json['isFavourite'] as bool? ?? false,
      priority: $enumDecodeNullable(_$PriorityStateEnumMap, json['priority']) ??
          PriorityState.none,
      isVisible: json['isVisible'] as bool? ?? true,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'isDone': instance.isDone,
      'isDeleted': instance.isDeleted,
      'isFavourite': instance.isFavourite,
      'priority': _$PriorityStateEnumMap[instance.priority]!,
      'isVisible': instance.isVisible,
    };

const _$PriorityStateEnumMap = {
  PriorityState.high: 'high',
  PriorityState.medium: 'medium',
  PriorityState.low: 'low',
  PriorityState.none: 'none',
};
