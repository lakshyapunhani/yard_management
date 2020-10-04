class Zone{

  bool active;
  String id;
  String name;

  Zone({
    this.active,
    this.id,
    this.name
  });

  Zone.fromJson(Map<String,dynamic> json){
    this.active = json['active'];
    this.id = json['id'];
    this.name = json['name'];
  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['id'] = this.id;
    data['name'] = this.name;
  }

}