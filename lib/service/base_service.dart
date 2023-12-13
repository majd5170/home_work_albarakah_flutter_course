import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  String baseUrl = 'https://dummyjson.com/products';
  
}

getData() async {
  Dio dio = Dio();

  String baseUral = 'https://dummyjson.com/products';

  Response response = await dio.get(baseUral);

  return response;
}
