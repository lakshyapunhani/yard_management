
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yard_management/common/httpRequest.dart';
import 'package:yard_management/data/CommonResponse.dart';
import 'package:yard_management/data/Zone.dart';
import 'package:yard_management/ui/Guard/InOutScreen.dart';

class ScannerScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ScannerState();

}

class ScannerState extends State<ScannerScreen>{

  var httpRequest = HttpRequest();

  void method(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => InOutScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    SafeArea(child: Column(mainAxisAlignment:MainAxisAlignment.start,
      crossAxisAlignment:CrossAxisAlignment.center,children: <Widget>[
        Container(height: 50
            ,color: Color(0xFF00b26c)
            ,child: Row(children: <Widget>[
              Expanded(flex: 1,child: Text("SCAN VEHICLE",style: TextStyle(fontSize:20,color: Colors.white))),
              Container(child: Image.asset('assets/images/icSwitchProfile.png'),height: 70,width: 70,padding: EdgeInsets.all(10)),
              Container(child: Image.asset('assets/images/icLogOut.png'),height: 70,width: 70,padding: EdgeInsets.all(10)),
            ],)),
        Expanded(child:
        Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/images/ic_scanner.png',width: 150,height: 150),
          InkWell(onTap: () => method(),
            child: Container(margin:EdgeInsets.fromLTRB(30,20,30,10),width: double.infinity,
                child: RaisedButton(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                  color: Color(0xFF00b26c),
                  child: Text("OPEN SCANNER",style: TextStyle(color: Colors.white)),
                  onPressed: () => method(),)),
          )
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

    CommonResponse<Zone> common = CommonResponse.fromJson(response);
    print(common.data);

    List<Zone> list = common.data;

  }

  void getYardId(){

  }
}