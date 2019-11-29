import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Request {
  static const String API = "https://analog-app.herokuapp.com";

  static Future<RequestResponse> makeRequest(String path, Object body, [String method = "GET"]) async {
    Client client;
    Response response;
    RequestResponse requestResponse;

    try {
      client = new Client();
      response = await client.get(API + path);
      requestResponse = new RequestResponse(
        response.statusCode,
        response.body,
        true
      );
    } on Exception catch (err) {
      requestResponse = new RequestResponse(
        500,
        "",
        false,
        err.toString()
      );
    } finally {
      client.close();
    }
    return requestResponse;
  }
}

class RequestResponse {
  int _statusCode;
  String _body;
  bool _completed;
  String _err;

  RequestResponse(
    this._statusCode,
    this._body,
    this._completed,
    [this._err]
  );
}

/*class Request {

  static final String apiEndpoint = "https://analog-app.herokuapp.com";

  static Future<Response> makeRequest(String path, String method, Object body) async {
      Client client = new Client();
      Response response;

    if (method == "get") {
      response = await client.get(apiEndpoint + path);
    } else if (method == "post") {
      response = await client.post(apiEndpoint + path, body: json.encode(body), headers: {
        "Content-Type": "application/json"
      });
    }

    client.close();
    return response;
  }

  static Future<dynamic> makeRequestJson(String path, String method, Object body) async {
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
*/