import 'package:dio/dio.dart';
import '../../../constants/url_constant.dart';

class HomeRepo {
  static Dio dio = Dio();
  static String url = BaseUrl;


  static Future<Response?> getUserData() async {



    try {
      Response res = await dio.get(
        BaseUrl,

      );
      return res;
    } catch (e) {
      print("Error 501 check");
      print(e);
      return null;
    }
  }
}
