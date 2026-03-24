  import 'package:bloc/bloc.dart';
  import 'package:equatable/equatable.dart';
  import 'package:clickresturant/data/model/product_model.dart';
  import 'package:clickresturant/data/repositories/remote/product_service.dart';

  part 'products_event.dart';
  part 'products_state.dart';

  class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
    final ProductService productService;

    ProductsBloc({required this.productService}) : super(ProductsInitial()) {
      on<ProductsEvent>(_getProducts);
    }

    Future<void> _getProducts(
        ProductsEvent event, Emitter<ProductsState> emit) async {
      emit(ProductsLoading());
      try {
        final products = await productService.getProducts();
        emit(Productsloaded(products: products));
      } catch (e) {
        emit(ProductsFailed(message: e.toString()));
        print("m $e");
      }
    }
  }
