import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:clickresturant/data/model/product_model.dart';
import 'package:clickresturant/data/repositories/remote/product_service.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductService productService;

  ProductsBloc({required this.productService}) : super(ProductsInitial()) {
    on<FetchProducts>(_getProducts);

    on<SelectProduct>(_selectProduct);
  }

  Future<void> _getProducts(
      FetchProducts event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    try {
      final products = await productService.getProducts();
      emit(Productsloaded(products: products));
    } catch (e) {
      print("Nour => $e");
      emit(ProductsFailed(message: e.toString()));
    }
  }

  void _selectProduct(SelectProduct event, Emitter<ProductsState> emit) {
    if (state is Productsloaded) {
      final current = state as Productsloaded;

      emit(Productsloaded(
        products: current.products,
        selectedProduct: event.productModel,
      ));
    }
  }
}
