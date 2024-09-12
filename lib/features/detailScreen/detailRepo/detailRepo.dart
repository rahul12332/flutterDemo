import 'package:dio/dio.dart';

class DetailRepo {
  static Dio dio = Dio();

  static Future<Response?> postDetail({
    required dynamic userId,
    required dynamic id,
    required String title,
    required String body,
  }) async {
    try {
      Map<String, dynamic> requestBody = {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

      Response res = await dio.post(
        "https://jsonplaceholder.typicode.com/posts",
        data: requestBody,
      );
      return res;
    } catch (e) {
      print("Error occurred during POST request: $e");
      return null;
    }
  }
}
