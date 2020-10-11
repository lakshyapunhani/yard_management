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

  // Zone.fromJson(Map<String,dynamic> json){
  //   this.active = json['active'];
  //   this.id = json['id'];
  //   this.name = json['name'];
  // }
  //
  // Map<String,dynamic> toJson(){
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['active'] = this.active;
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  // }

}