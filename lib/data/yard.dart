import 'package:json_annotation/json_annotation.dart';

part 'yard.g.dart';

@JsonSerializable(nullable: false)
class Yard{

  String id;
  String zone_id;

  Yard({
    this.id,
    this.zone_id
  });

  factory Yard.fromJson(Map<String, dynamic> json) => _$YardFromJson(json);
  Map<String, dynamic> toJson() => _$YardToJson(this);

}