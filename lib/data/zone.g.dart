// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Zone _$ZoneFromJson(Map<String, dynamic> json) {
  return Zone(
    active: json['active'] as bool,
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ZoneToJson(Zone instance) => <String, dynamic>{
      'active': instance.active,
      'id': instance.id,
      'name': instance.name,
    };
