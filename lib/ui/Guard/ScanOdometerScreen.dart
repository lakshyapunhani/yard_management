import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanOdometerScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => ScanOdometerState();
}

class ScanOdometerState extends State<ScanOdometerScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(children: [
      Container(color: Color(0XFFc7e2d4),height: 50,child: Row(children: [
        Container(child: Image.asset('assets/images/tick.png'),height: 50,width: 50,padding: EdgeInsets.all(10)),
      ],),)
    ],),),);
  }

}