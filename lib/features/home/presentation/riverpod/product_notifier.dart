import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/product_usecase.dart';


class ProductNotifier extends StateNotifier<ProductState> {
  final ProductUseCase getProduct;

  ProductNotifier(this.getProduct) : super(ProductInitial());

  Future<void> fetchProduct(int id) async {
    state = ProductLoading();
    try {
      final product = await getProduct(id: id);
      state = ProductLoaded(product);
    } catch (e) {
      state = ProductError(e.toString());
    }
  }
}
