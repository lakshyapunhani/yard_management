import 'package:json_annotation/json_annotation.dart';

part 'onboarding_details.g.dart';

@JsonSerializable(nullable: false)

class OnboardingDetails{
  String owner_name;
  String owner_phone;

  OnboardingDetails({
    this.owner_name,
    this.owner_phone
  });

  factory OnboardingDetails.fromJson(Map<String, dynamic> json) => _$OnboardingDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$OnboardingDetailsToJson(this);

}