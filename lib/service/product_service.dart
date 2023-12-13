import 'package:dio/dio.dart';
import 'package:secode_exam_flutter/service/base_service.dart';

abstract class ProductService extends BaseService {
  getAllProduct();
}


class Service_Product extends ProductService{
 @override
  getAllProduct() async {
    Response response = await dio.get(baseUrl);
    return response.data;
  }
}