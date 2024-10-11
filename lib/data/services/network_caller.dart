import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../models/network_respons.dart';

class NetworkCaller {
 static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint(url);
      final Response response = await get(uri);
     printResponse(url, response);
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decoded);
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode);
      }
    } catch (e) {
      return NetworkResponse(
          isSuccess: false, statusCode: -1,
          errorMessage: e.toString(),
      );
    }
  }


 static Future<NetworkResponse> postRequest(
     {required String url, Map<String, dynamic>? body}) async {
   try {
     Uri uri = Uri.parse(url);
     debugPrint(url);
     final Response response = await post(uri,
     headers: {
       'Content-Type':'application/json'
     },
       body: jsonEncode(body),
     );
     printResponse(url, response);
     if (response.statusCode == 200) {
       final decoded = jsonDecode(response.body);
       if(decoded['status']=='fail'){
          return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: decoded['data'],
          );
        }
        return NetworkResponse(
           isSuccess: true,
           statusCode: response.statusCode,
           responseData: decoded);
     } else {
       return NetworkResponse(
           isSuccess: false, statusCode: response.statusCode);
     }
   } catch (e) {
     return NetworkResponse(
       isSuccess: false, statusCode: -1,
       errorMessage: e.toString(),
     );
   }
 }




 static void printResponse(String url,Response response){
    debugPrint(
      'URL:$url\nRESPONSE CODE:${response.statusCode}\nBODY: ${response.body}',
    );
  }
}
