part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class Productsloaded extends ProductsState {
  final List<ProductModel> products;
  final ProductModel? selectedProduct;

  Productsloaded({
    required this.products,
    this.selectedProduct,
  });

  @override
  List<Object?> get props => [products, selectedProduct!];
}

// class Productsloaded extends ProductsState {
//   final List<ProductModel> products;
//   final ProductModel? selectedProduct;
//   Productsloaded({required this.products, this.selectedProduct});
//   @override
//   List<Object?> get props => [products, selectedProduct];
// }

class ProductsFailed extends ProductsState {
  final String message;
  ProductsFailed({required this.message});
}
