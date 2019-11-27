import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dart:convert';

class Request {

  static final String apiEndpoint = "https://analog-app.herokuapp.com/";

  static Future<Response> makeRequest(String path, String method, Object body) async {
      Client client = new Client();
      Response response;

    if (method == "get") {
      response = await client.get(apiEndpoint + path);
    } else if (method == "post") {
      response = await client.post(apiEndpoint + path, body: body);
    }

    client.close();
    return response;
  }

  static Future<dynamic> makeRequestJson(String path, String method, String body) async {
    Response response = await makeRequest(path, method, body);

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
