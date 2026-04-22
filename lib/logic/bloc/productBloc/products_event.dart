part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class FetchProducts extends ProductsEvent {}

class SelectProduct extends ProductsEvent {
  final ProductModel productModel;
  SelectProduct(this.productModel);
  @override
  List<Object?> get props => [productModel];
}
