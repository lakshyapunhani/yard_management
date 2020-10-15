import 'package:json_annotation/json_annotation.dart';
import 'package:yard_management/data/onboarding_details.dart';

part 'vehicle_details.g.dart';

@JsonSerializable(nullable: false)
class VehicleDetails {

  String id;
  String registration_number;
  double odometer_reading;
  String model;
  OnboardingDetails on_boarding_detail;

  VehicleDetails({
    this.id,
    this.registration_number,
    this.odometer_reading,
    this.model,
    this.on_boarding_detail
  });

  factory VehicleDetails.fromJson(Map<String, dynamic> json) => _$VehicleDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleDetailsToJson(this);


}