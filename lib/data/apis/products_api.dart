import 'package:bloc_ex/constants/strings.dart';
import 'package:dio/dio.dart';
class ProductsApi {
  late Dio dio;

  ProductsApi() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiRoute.products,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30)
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> allProducts () async{
    try {
      Response response = await dio.get('/');
      return response.data;
    } catch(e) {
      throw Exception(e.toString());
    }
  }
}