import 'package:dio/dio.dart';



class HomeRepository {

  Future<Response> getHomeData() async {
    final response = await Dio().get(
        'https://student.valuxapps.com/api/home');
    return response;
  }

//هخلي نوع الداتا هنا ديناميك  علشان افرغ الريسبونس واستقبل الداتا بدل ما ارجع افرغها بعد ما اجيبها
  Future<dynamic> getCategoriesData() async {
    final response = await Dio().get(
        'https://student.valuxapps.com/api/categories');
    return response.data;
  }

  Future<dynamic> getBannersData() async {
    Response response = await Dio().get(
        'https://student.valuxapps.com/api/banners');
    return response.data;
  }
}