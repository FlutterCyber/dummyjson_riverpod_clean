import 'package:dummyjson_riverpod_clean/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/categories/categories_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesNotifier extends StateNotifier<CategoriesState> {
  final GetCategoriesUsecase getCategoriesUsecase;

  CategoriesNotifier(this.getCategoriesUsecase) : super(CategoriesInitial());

  Future<void> getCategories() async {
    state = CategoriesLoading();
    try {
      final categories = await getCategoriesUsecase.call();
      state = CategoriesLoaded(categories);
    } catch (e) {
      state = CategoriesError(e.toString());
    }
  }
}
