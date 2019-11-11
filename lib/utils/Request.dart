import 'package:http/http.dart' as http;

class Request {

  static final String API_ENDPOINT = "";
  static final String USER_AGENT = "";


  static Future<http.Response> makeRequest(String path) async{
    var client = new http.Client();
    try{
      var response = await client.get(API_ENDPOINT + path,
        headers: {
          "user-agent": USER_AGENT
        }
      );
      return response;
    }finally{
      client.close();
    }
  } 
}
