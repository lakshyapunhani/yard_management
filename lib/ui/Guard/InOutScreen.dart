import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ScanOdometerScreen.dart';

class InOutScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => InOutState();

}

class InOutState extends State<InOutScreen>
{

  void method(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ScanOdometerScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(children: [
      Padding(padding: EdgeInsets.all(10),
          child: Card(child: Column(children: [
            Row(children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Container(child: Image.asset('assets/images/user.png'),height: 70,width: 70,padding: EdgeInsets.all(10)),
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(flex: 1,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("KK Kapoor"),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text("1234567890")
                ]),
              ),
              Container(child: Image.asset('assets/images/edit.png'),height: 50,width: 50,padding: EdgeInsets.all(10)),
            ],),
            Padding(padding: EdgeInsets.all(10.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text("TATA 407"),
                Text("DL 04 HE 6373"),
              ],),
            )
          ],),)
      ),

      Expanded(flex: 1,
        child:  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(onTap: () => method(),
            child: Container(height: 160,child:
                  Image.asset('assets/images/inEnabled.png'),
                    margin: EdgeInsets.fromLTRB(10,10,10,20)),
          ),
          Container(height: 160,child: Image.asset('assets/images/outEnabled.png'),margin: EdgeInsets.fromLTRB(10,20,10,10))
        ],),
      )

    ]),),);
  }

}