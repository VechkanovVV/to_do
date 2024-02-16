// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      isDone: json['isDone'] as bool? ?? false,
      isFavourite: json['isFavourite'] as bool? ?? false,
      priority: $enumDecodeNullable(_$PriorityStateEnumMap, json['priority']) ??
          PriorityState.none,
      isVisible: json['isVisible'] as bool? ?? true,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'isDone': instance.isDone,
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
