// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleDetails _$VehicleDetailsFromJson(Map<String, dynamic> json) {
  return VehicleDetails(
    id: json['id'] as String,
    registration_number: json['registration_number'] as String,
    odometer_reading: (json['odometer_reading'] as num).toDouble(),
    model: json['model'] as String,
    on_boarding_detail: OnboardingDetails.fromJson(
        json['on_boarding_detail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VehicleDetailsToJson(VehicleDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'registration_number': instance.registration_number,
      'odometer_reading': instance.odometer_reading,
      'model': instance.model,
      'on_boarding_detail': instance.on_boarding_detail,
    };
