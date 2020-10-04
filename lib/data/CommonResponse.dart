class CommonResponse<T> {

  int total;
  List<T> data;
  bool success;

  CommonResponse({
    this.total,
    this.data,
    this.success});

  CommonResponse.fromJson(Map<String,dynamic> json){
    total = json['total'];
    data = json['data'];
    success = json['success'];
  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['data'] = this.data;
    data['success'] = this.success;
  }

}