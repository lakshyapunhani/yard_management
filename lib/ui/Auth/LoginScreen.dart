import 'dart:convert';

import 'package:toast/toast.dart';
import 'package:yard_management/ui/Auth/VerifyOtp.dart';

import '../../common/httpRequest.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yard_management/common/httpRequest.dart';


class LoginScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    TextEditingController textEditingController = new TextEditingController();

    void login() async{
      var httpRequest = HttpRequest();
      String username = textEditingController.text;

      try{
        var result = await httpRequest.getNewOtp(username);
        Toast.show("Success", context);

        Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtp(username: username)));
      }
      catch(e){
        print(e.toString());
        Toast.show("Some error occurred. Please try again", context);
      }
    }

    return Scaffold(backgroundColor: Color(0xFFEAEAEA),
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(flex: 2, child:
          Center(child:
          Container(height:100,width: 100,child:
          Image.asset('assets/images/ic_launcher.png')))),
          Expanded(flex: 2,child: Container(margin: EdgeInsets.all(20),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Enter Mobile Number"),
                  SizedBox(height: 15),
                  TextField(
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.characters,
                    controller: textEditingController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.teal)),
                        hintText: ''
                    ),
                  )
                ],))),
          Container(width: double.infinity,height: 50
            ,child:  RaisedButton(onPressed: () { login(); },color: Colors.teal,
              child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 16),),),)
        ],),
      ),);
  }



}