import 'package:dio/dio.dart';
import 'package:final_flutter_ewallet/utils/helper/dialog_helper.dart';

class DioClient {
  static Dio dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:3000/api'));

  //GET
  static Future<dynamic> get(String url, {bool loading = true}) async {
    try {
      dio.options.headers.clear();
      if (loading) Loading.show();
      var response = await dio.get(url);
      if (loading) Loading.hide();
      if (response.statusCode == 200) {
        return response.data;
      } else {
        DialogHelper.showErrorDialog(description: response.statusMessage!);
      }
    } catch (e) {
      Loading.hide();
      print(e);
    }
  }

  //POST
  static Future<dynamic> post(String url, dynamic body,
      {bool loading = true, String key = ''}) async {
    Loading.show();
    dio.options.headers.clear();
    if (key == "data-form") {
      dio.options.headers.addAll({
        "Content-Type": "multipart/form-data",
        "Accept": "application/json",
      });
    }
    try {
      var response = await dio.post(url, data: body);
      print("==================${response}==================");
      Loading.hide();
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(response);
      }
      Loading.hide();
    } catch (e) {
      Loading.hide();
      print(e);
    }
  }

  //delete
  static Future<dynamic> delete(
    String url,
    dynamic body,
  ) async {
    try {
      dio.options.headers.clear();
      var response = await dio.delete(url, data: body);
      print("==================${response}==================");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(response);
      }
      Loading.hide();
    } catch (e) {
      Loading.hide();
      print(e);
    }
  }

  //POST with DATA-FORM
  static Future<dynamic> postDataForm(String url, dynamic body,
      {bool loading = true}) async {
    Loading.show();
    try {
      await Future.delayed(const Duration(seconds: 2));
      var response = await dio.post(url, data: body);
      print(response);
      Loading.hide();
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(response);
      }
      Loading.hide();
    } catch (e) {
      Loading.hide();
      print(e);
    }
  }
}
