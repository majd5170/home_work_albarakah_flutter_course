import 'package:dio/dio.dart';
import 'package:laza_app/model/product_model.dart';

abstract class BaseService {
  Dio dio = Dio();
  String baseurl = 'https://dummyjson.com/products';
  String baseurlcategories = 'https://dummyjson.com/products/categories';
 late Response response;
}


abstract class ProductsService extends BaseService {
  Future getAllProduct();
  Future getAllProductcategories();
  Future getOneCategory(String category);
  createNewProduct(ProductModel newProdcut);
  deleteProduct(num id);

  static product_model(ProductModel createNewProduct) {}
}


class ProductsServiceImp extends ProductsService {
  @override
  Future getAllProduct()async {
    response =await dio.get(baseurl);
    return response.data;
  }
   @override
  createNewProduct(ProductModel newProdcut) async {
    Response response = await dio.post(baseurl, data: newProdcut.toJson());
    return response.data;
  }
  @override
  deleteProduct(num id) async {
    Response response = await dio.delete(baseurl + '/' + id.toString());
    return response.data;
  }
  
  @override
  Future getOneCategory(String category) async {
    Response response = await dio.get(baseurl + category);
    return response.data;
  }
  
  @override
  Future getAllProductcategories()async {
    response =await dio.get(baseurlcategories);
    return response.data;
  }

}
