
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yard_management/common/httpRequest.dart';
import 'package:yard_management/data/common_response.dart';
import 'package:yard_management/data/zone.dart';

class ScannerScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ScannerState();

}

class ScannerState extends State<ScannerScreen>{

  var httpRequest = HttpRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    SafeArea(child: Column(mainAxisAlignment:MainAxisAlignment.start,
      crossAxisAlignment:CrossAxisAlignment.center,children: <Widget>[
        Container(height: 50
            ,color: Color(0xFF00b26c)
            ,child: Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(flex: 1,child: Text("SCAN VEHICLE",style: TextStyle(fontSize:20,color: Colors.white))),
              SvgPicture.asset('assets/images/ic_switch_profile.svg',height: 30,width: 30,color: Colors.white,),
              Padding(padding: EdgeInsets.only(left: 20),),
              SvgPicture.asset('assets/images/ic_log_out.svg',height: 30,width: 30,color: Colors.white,)
            ],)),
        Expanded(child:
        Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/images/ic_scanner.png',width: 150,height: 150),
          Container(margin:EdgeInsets.fromLTRB(30,20,30,10),width: double.infinity,
              child: RaisedButton(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
                color: Color(0xFF00b26c),
                child: Text("Open Scanner",style: TextStyle(color: Colors.white)),
                onPressed: (){
                },))
        ],),))
      ],)));
  }

  @override
  void initState() {
    print('initstate called');
    getZoneId();
  }

  void getZoneId() async{
    Map<String,dynamic> map = new Map();
    map.putIfAbsent('__page', () => '1');
    map.putIfAbsent('__only', () => 'id,name,geom,description,active');
    map.putIfAbsent('__limit', () => '1');
    map.putIfAbsent('order_by', () => 'created_on');

    var response = await httpRequest.getZones(map);
    print(response.toString());

    var common = CommonResponse<Zone>.fromJson(response, (data) => Zone.fromJson(data));

    for (var zone in common.data) {
      print(zone.id);
    }
  }

  void getYardId(){

  }
}