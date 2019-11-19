import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dart:convert';


class Request {

  static final String apiEndpoint = "http://ip.jsontest.com";

  static Future<Response> makeRequest(String path) async {
    var client = new Client();
    try {
      var response = await client.get(apiEndpoint + path);
      return response;
    } catch(error) {
      debugPrint(error);
    } finally {
     client.close();
    }
  }

  static Future<dynamic> makeRequestJson(String path) async {
    Response response = await makeRequest(path);

    return {
      "statusCode": response.statusCode.toString(),
      "jsonBody": tryParse(response.body) as dynamic,
      "headers": response.headers,
    };
  } 

  static dynamic tryParse(String data) {
    try {
      return json.decode(data) as dynamic;
    } catch(err) {
      return false;
    }
  }
}
