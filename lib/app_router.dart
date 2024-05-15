import 'package:bloc_ex/blocs/cubit/cubit/product_cubit.dart';
import 'package:bloc_ex/constants/strings.dart';
import 'package:bloc_ex/data/apis/products_api.dart';
import 'package:bloc_ex/data/repository/product_repo.dart';
import 'package:bloc_ex/presentation/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late ProductRepo productRepo = ProductRepo(productsApi: ProductsApi());
  late ProductCubit productCubit = ProductCubit(productRepo);
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppCharRoute.splash:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => productCubit,
                  child: const Splash(),
                ));
    }
    return null;
  }
}
