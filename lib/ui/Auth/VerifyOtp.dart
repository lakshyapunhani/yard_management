import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:toast/toast.dart';
import 'package:yard_management/common/SessionManager.dart';
import 'package:yard_management/ui/SelectProfileScreen.dart';

import '../../common/httpRequest.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yard_management/common/httpRequest.dart';


class VerifyOtp extends StatelessWidget{

  String username;

  VerifyOtp({Key key, @required this.username}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    TextEditingController textEditingController = new TextEditingController();

    void login() async{
      var httpRequest = HttpRequest();
      String otp = textEditingController.text;

      try{
        var result = await httpRequest.verifyOtp(username,otp);
        print(result.toString());
        Toast.show("Success", context);
        String token = result['token'];
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        print(decodedToken.toString());
        String name = decodedToken['name'];
        String mobile_number = decodedToken['mobile_number'];
        String id = decodedToken['id'];

        saveUserDetails(result['token'], name, mobile_number, id);

        Navigator.push(context, MaterialPageRoute(builder: (context) => SelectProfileScreen()));
      }
      catch(e){
        print(e.toString());
        Toast.show("Some error occurred. Please try again", context);
      }
    }

    void getOtp() async{
      var httpRequest = HttpRequest();

      try{
        var result = await httpRequest.getNewOtp(username);
        Toast.show("Success", context);
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
                  Text("Enter OTP"),
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
                  ),
                  SizedBox(height: 15),
                  Container(alignment: Alignment.center,
                      width: double.infinity,
                      child: InkWell(onTap: getOtp,
                          child: Text("Didn't got otp? Retry",
                            style: TextStyle(decoration: TextDecoration.underline),))),
                ],))),
          Container(width: double.infinity,height: 50
            ,child:  RaisedButton(onPressed: () { login(); },color: Colors.teal,
              child: Text("SUBMIT",style: TextStyle(color: Colors.white,fontSize: 16),),),)
        ],),
      ),);
  }



}