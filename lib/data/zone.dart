import 'package:json_annotation/json_annotation.dart';

part 'zone.g.dart';

@JsonSerializable(nullable: false)
class Zone{

  bool active;
  String id;
  String name;

  Zone({
    this.active,
    this.id,
    this.name
  });

  factory Zone.fromJson(Map<String, dynamic> json) => _$ZoneFromJson(json);
  Map<String, dynamic> toJson() => _$ZoneToJson(this);


}