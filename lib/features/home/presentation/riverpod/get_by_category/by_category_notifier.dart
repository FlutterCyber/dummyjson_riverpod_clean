import 'package:dummyjson_riverpod_clean/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:dummyjson_riverpod_clean/features/home/domain/usecases/get_product_by_category_usecase.dart';
import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/categories/categories_state.dart';
import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/get_by_category/by_category_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ByCategoryNotifier extends StateNotifier<ByCategoryState> {
  final GetProductByCategoryUsecase getProductByCategoryUsecase;

  ByCategoryNotifier(this.getProductByCategoryUsecase)
      : super(ByCategoryInitial());

  Future<void> getCategories({required String url}) async {
    state = ByCategoryLoading();
    try {
      final byCategories = await getProductByCategoryUsecase.call(url: url);
      state = ByCategoryLoaded(byCategories);
    } catch (e) {
      state = ByCategoryError(e.toString());
    }
  }
}
