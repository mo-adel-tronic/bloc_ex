import 'package:bloc_ex/data/apis/products_api.dart';
import 'package:bloc_ex/data/repository/product_repo.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: MaterialButton(
        onPressed: () async{
          ProductsApi api = ProductsApi();
          ProductRepo repo = ProductRepo(productsApi: api);
          repo.allProducts().then((val) {
            print(val.map((p) => p.title));
          });
        },
        child: Text('click'),
      ),
    ));
  }
}