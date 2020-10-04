import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectDockScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => SelectDockState();
}

class SelectDockState extends State<SelectDockScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: SafeArea(child: Center(child: Text("Select Dock state"))));
  }

}