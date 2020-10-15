
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yard_management/common/SessionManager.dart';
import 'package:yard_management/common/httpRequest.dart';
import 'package:yard_management/data/common_response.dart';
import 'package:yard_management/data/vehicle_details.dart';
import 'package:yard_management/data/yard.dart';
import 'package:yard_management/data/zone.dart';
import 'package:yard_management/ui/Guard/InOutScreen.dart';
import 'package:yard_management/ui/Guard/VehicleNotFoundScreen.dart';

class ScannerScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ScannerState();
}

class ScannerState extends State<ScannerScreen>{

  var httpRequest = HttpRequest();
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

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
                getVehicleDetails("HR38W3403");
                },))
        ],),))
      ],)));
  }

  void getVehicleDetails(String vehicleNumber) async{

    Map<String,dynamic> map = Map();
    map.putIfAbsent("__registration_number__equal", () => vehicleNumber);

    try{
      var response = await httpRequest.getVehicleDetails(map);

      CommonResponse common = CommonResponse<VehicleDetails>.fromJson(response,
              (data) => VehicleDetails.fromJson(data));

      List<VehicleDetails> vehicles = common.data;
      if(vehicles != null && vehicles.length > 0){
        VehicleDetails vehicleDetails = vehicles[0];
        print(vehicleDetails.model);
        Navigator.push(context, MaterialPageRoute(builder: (context) => InOutScreen()));
      }
    }
    catch(e){
      Navigator.push(context, MaterialPageRoute(builder: (context) => VehicleNotFoundScreen()));
    }


    
  }

  @override
  void initState() {
    print('initstate called');
    getZoneId();
    initPlatformState();
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

  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData;

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    Map<String,dynamic> map = new Map();
    map.putIfAbsent('manufacturer', () => deviceData['manufacturer']);
    map.putIfAbsent('model', () => deviceData['model']);
    map.putIfAbsent('androidVersion', () => deviceData['version.release']);
    map.putIfAbsent('sdk', () => deviceData['version.sdkInt']);
    map.putIfAbsent('app_version', () => '1.6');
    if(Platform.isAndroid){
      map.putIfAbsent('device_type', () => 'Android');
    }
    else{
      map.putIfAbsent('device_type', () => 'IOS');
    }

    Map<String,dynamic> deviceDataMap = new Map();
    deviceDataMap.putIfAbsent('device_details', () => map);
    String userId = await getUserId();

    try{
      var response = await httpRequest.patchDeviceDetails(deviceDataMap,userId);
      print(response.toString());
    }
    catch(e){
    }

  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}