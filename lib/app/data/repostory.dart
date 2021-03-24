import 'package:get/get_connect/connect.dart';

String baes_url = 'https://dev.matrixclouds.com/erada_kids/public/api';
String api_key = 'mwDA9w';
String Language = 'ar';

class RepostoryProvide extends GetConnect {
  final header = {
    'x-api-key': api_key,
    'Content-Language': Language,
  };

  Future<Response> repPost(url, body) async {
    Response response = await post(baes_url + "/" + url, body, headers: header);

    switch (response.statusCode) {
      case 200:
        return response;
        break;
      case 500:
        return Future.error('error');
        break;
      case 401:
        return Future.error('error');
        break;
      default:
        return Future.error('error');
    }
  }

  Future<Response> repGet(url) async {
     print(baes_url + "/" + url);
    Response response = await get(baes_url + "/" + url, headers: header);
   //print(response.bodyString);
    //print(response.hasError);
    switch (response.statusCode) {
      case 200:
        return response;
        break;
      case 500:
        return Future.error('error');
        break;
      case 401:
        return Future.error('error');
        break;
      default:
        return Future.error('error');
    }

    //return await get(baes_url + "/" + url);
  }
}
