
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yard_management/common/httpRequest.dart';
import 'package:yard_management/data/common_response.dart';
import 'package:yard_management/data/yard.dart';
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
              Image.asset('assets/images/icSwitchProfile.png',width: 30,height: 30),
              Padding(padding: EdgeInsets.only(left: 20)),
              Image.asset('assets/images/icLogOut.png',width: 30,height: 30),
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

    CommonResponse common = CommonResponse<Zone>.fromJson(response, (data) => Zone.fromJson(data));

    List<Zone> zones = common.data;
    if(zones != null && zones.length > 0){
      Zone zone = zones[0];
      getYardId(zone.id);
    }
  }

  void getYardId(String zoneId) async{
    print("Get Yard Id method");
    print(zoneId);

    Map<String,dynamic> map = new Map();
    map.putIfAbsent('__zone_id__equal', () => zoneId);
    map.putIfAbsent('__only', () => 'id');

    var response = await httpRequest.getYard(map);
    print(response.toString());

    CommonResponse common = CommonResponse<Yard>.fromJson(response, (data) => Yard.fromJson(data));

    List<Yard> yards = common.data;
    if(yards != null && yards.length > 0){
      Yard yard = yards[0];
      print(yard.id);
    }


  }
}