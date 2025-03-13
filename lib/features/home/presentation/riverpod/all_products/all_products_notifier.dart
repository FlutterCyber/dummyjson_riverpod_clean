import 'package:dummyjson_riverpod_clean/features/home/domain/usecases/get_all_products_usecase.dart';
import 'package:dummyjson_riverpod_clean/features/home/domain/usecases/search_all_products_usecase.dart';
import 'package:dummyjson_riverpod_clean/features/home/domain/usecases/sort_all_products_usecase.dart';
import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/all_products/all_products_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllProductsNotifier extends StateNotifier<AllProductsState> {
  final GetAllProductsUsecase getAllProductsUsecase;
  final SearchAllProductsUsecase searchAllProductsUsecase;
  final SortAllProductsUsecase sortAllProductsUsecase;

  AllProductsNotifier(
    this.getAllProductsUsecase,
    this.searchAllProductsUsecase,
    this.sortAllProductsUsecase,
  ) : super(AllProductsInitial());

  Future<void> getAllProducts() async {
    state = AllProductsLoading();
    try {
      final allProducts = await getAllProductsUsecase();
      state = AllProductsLoaded(allProducts);
    } catch (e) {
      state = AllProductsError(e.toString());
    }
  }

  Future<void> searchAllProducts({required String word}) async {
    state = AllProductsLoading();
    try {
      final searchAllProducts = await searchAllProductsUsecase(word: word);
      state = AllProductsLoaded(searchAllProducts);
    } catch (e) {
      state = AllProductsError(e.toString());
    }
  }

  Future<void> sortAllProducts({
    required String sortName,
    required String ascDesc,
  }) async {
    state = AllProductsLoading();
    try {
      final sortAllProducts =
          await sortAllProductsUsecase(sortName: sortName, ascDesc: ascDesc);
      state = AllProductsLoaded(sortAllProducts);
    } catch (e) {
      state = AllProductsError(e.toString());
    }
  }
}
