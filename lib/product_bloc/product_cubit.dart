import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/product_model.dart';
import '../services/all_products_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    try {
      final products = await AllProductsServices().getAllProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError("Failed to load products"));
    }
  }
}
