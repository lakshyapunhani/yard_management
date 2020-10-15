import 'dart:convert';
import 'dart:io';
import 'package:yard_management/common/SessionManager.dart';

import 'package:http/http.dart' as http;

class HttpRequest
{
  var url = "synco-api.roadcast.co.in";

  Future<Map> getNewOtp(String username) async{
    var response = await http.post(createUri('/api/v1/auth/user_mobile_login/new_otp'),
        body:json.encode({'mobile_number':username}),headers: await getHeaders());
    if(response.statusCode == 200){
        return json.decode(response.body);
    }
    return throw (response.statusCode.toString());
  }

  Future<Map> verifyOtp(String username,String otp) async{
    var response = await http.post(createUri('/api/v1/auth/user_mobile_login/verify'),
        body:json.encode({'mobile_number':username,'otp':otp}),headers: await getHeaders());
    if(response.statusCode == 200){
      return json.decode(response.body);
    }
    return throw (response.statusCode.toString());
  }
  
  Future<Map> getZones(Map params) async{
    var response = await http.get(createUri('/api/v1/auth/zone',
        params: params),headers: await getHeaders());
    if(response.statusCode == 200){
      return json.decode(response.body);
    }
    return throw (response.statusCode.toString());
  }

  Future<Map> getYard(Map params) async{
    var response = await http.get(createUri('/api/v1/yard/yard',
        params: params),headers: await getHeaders());
    if(response.statusCode == 200){
      return json.decode(response.body);
    }
    return throw (response.statusCode.toString() + response.body.toString());
  }

  Future<Map> patchDeviceDetails(Map params,String userId) async{
    String url = createUri('/api/v1/auth/user/' + userId);
    var response = await http.patch(url,
        body:json.encode(params),headers: await getHeaders());
    if(response.statusCode == 200){
      return json.decode(response.body);
    }
    return throw (response.statusCode.toString() + response.body.toString());
  }

  Future<Map> getVehicleDetails(Map params) async{
    var response = await http.get(createUri('/api/v1/auth/vehicle',
        params: params),headers: await getHeaders());
    if(response.statusCode == 200){
      return json.decode(response.body);
    }
    return throw (response.statusCode.toString() + response.body.toString());
  }

  String createUri(String path, {String id, Map params}) {
    if (id != null) {
      path += id;
    }
    return new Uri(scheme: 'https',
        host: url,
        path: path,
        queryParameters: params).toString();
  }

  Future<Map<String, String>> getHeaders() async {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: await getToken()
    };
  }

}
