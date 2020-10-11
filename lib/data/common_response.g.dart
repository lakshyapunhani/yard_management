// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponse<T> _$CommonResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object json) fromJsonT) {
  return CommonResponse<T>(
    total: json['total'] as int,
    data: (json['data'] as List)?.map(fromJsonT)?.toList(),
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$CommonResponseToJson<T>(
  CommonResponse<T> instance,
  Object Function(T value) toJsonT) =>
    <String, dynamic>{
      'total': instance.total,
      'data': instance.data?.map(toJsonT)?.toList(),
      'success': instance.success,
    };
