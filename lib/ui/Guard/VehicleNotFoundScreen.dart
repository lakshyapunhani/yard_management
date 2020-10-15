
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VehicleNotFoundScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => VehicleNotFoundState();

}

class VehicleNotFoundState extends State<VehicleNotFoundScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(children: [
      Container(padding: EdgeInsets.only(left: 10),
        color: Color(0XFFffbbae),height: 50,child: Row(children: [
        Container(child: Image.asset('assets/images/icVehicleNotFound.png'),
            height: 50,width: 50,padding: EdgeInsets.all(10)),
        Text("Vehicle Not Found",style: TextStyle(color: Color(0xFFB53D2E),fontSize: 16))
      ],),),
      Padding(padding: EdgeInsets.fromLTRB(20,20,10,10),
        child: Align(alignment: Alignment.centerLeft,
            child: Text("Please onboard vehicle",style:
            TextStyle(color: Colors.black,fontSize: 16))),
      ),
      Divider(color: Colors.black,height: 4,thickness:0.5),
      Container(padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
        child: Column(children: [
          Row(children: [
            Container(child: Image.asset('assets/images/user.png'),
                height: 30,width: 30),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text("Driver Photograph",style: TextStyle(color: Colors.black,fontSize: 16))
          ],),
          Align(alignment: Alignment.centerLeft,
              child: Text("Vehicle Number",style:
              TextStyle(color: Colors.black,fontSize: 16))),

        ],))

    ],)));
  }

}