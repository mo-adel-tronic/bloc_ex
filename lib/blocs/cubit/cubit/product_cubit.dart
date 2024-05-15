import 'package:bloc_ex/data/repository/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_ex/data/models/product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
  late List<Product> products;
  ProductCubit(this.productRepo) : super(ProductInitial());

  List<Product> getAllProduct() {
    productRepo.allProducts().then((products) {
      emit(ProductLoaded(products));
      this.products = products;
    });
    return products;
  }
}
