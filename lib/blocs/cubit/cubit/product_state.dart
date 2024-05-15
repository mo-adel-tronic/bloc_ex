part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
}
