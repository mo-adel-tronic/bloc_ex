
import 'package:bloc_ex/data/apis/products_api.dart';
import 'package:bloc_ex/data/models/product.dart';

class ProductRepo {
  final ProductsApi productsApi;

  ProductRepo({required this.productsApi});

  Future<List<Product>> allProducts () async {
    final products = await productsApi.allProducts();
    return products.map((product) => Product.fromJson(product)).toList();
  }
}