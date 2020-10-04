
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yard_management/common/SessionManager.dart';
import 'package:yard_management/ui/Guard/ScannerScreen.dart';
import 'package:yard_management/ui/Supervisor/SelectDockScreen.dart';

class SelectProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SelectProfileState();

}

enum Profile { guard, supervisor }


class SelectProfileState extends State<SelectProfileScreen>{

  String userName;
  String userMobileNumber;
  String userId;
  String token;

  Profile _profile = Profile.guard;

  void getDetails() async{
    userName = await getUserName();
    userMobileNumber = await getUserMobile();
    userId = await getUserId();
    token = await getToken();
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context)  {

    getDetails();

    return Scaffold(body:
        Center(child:
           Wrap(children: <Widget>[
              Container(margin:EdgeInsets.fromLTRB(20,0,0,20),
                  child: Text("Select Role",style: TextStyle(fontSize: 20),)),
              Card(elevation: 10,margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(children: <Widget>[
                      ListTile(title: Text("Guard"),leading: Radio(
                        value: Profile.guard,
                        groupValue: _profile,
                        onChanged: (Profile value) {
                          setState(() {
                            _profile = value;
                          });
                        },
                      )) ,
                      ListTile(title: Text("Supervisor"),leading: Radio(
                        value: Profile.supervisor,
                        groupValue: _profile,
                        onChanged: (Profile value) {
                          setState(() {
                            _profile = value;
                          });
                        },
                      ))
                    ],)),
             Container(margin:EdgeInsets.fromLTRB(30,20,30,10),width: double.infinity,
                 child: RaisedButton(color: Colors.blue,
                   child: Text("Submit",style: TextStyle(color: Colors.white)),
                   onPressed: (){
                   if(_profile == Profile.guard){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ScannerScreen()));
                   }
                   else{
                     Navigator.push(context, MaterialPageRoute(builder: (context) => SelectDockScreen()));
                   }
                 },)),
            ],),
          ));
  }

}
