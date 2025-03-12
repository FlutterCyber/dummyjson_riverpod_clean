import 'package:dummyjson_riverpod_clean/features/home/domain/usecases/get_all_products_usecase.dart';
import 'package:dummyjson_riverpod_clean/features/home/domain/usecases/search_all_products_usecase.dart';
import 'package:dummyjson_riverpod_clean/features/home/domain/usecases/sort_all_products_usecase.dart';
import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/all_products/all_products_notifier.dart';
import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/all_products/all_products_state.dart';
import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/single_product/product_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/product_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/product_usecase.dart';
import 'single_product/product_state.dart';
import 'package:dio/dio.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final productRemoteDataSourceProvider =
    Provider<ProductRemoteDataSource>((ref) {
  return ProductRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(ref.watch(productRemoteDataSourceProvider));
});

final getProductUseCaseProvider = Provider<ProductUseCase>((ref) {
  return ProductUseCase(ref.watch(productRepositoryProvider));
});

final getAllProductsUseCaseProvider = Provider<GetAllProductsUsecase>((ref) {
  return GetAllProductsUsecase(ref.watch(productRepositoryProvider));
});

final searchAllProductUseCaseProvider =
    Provider<SearchAllProductsUsecase>((ref) {
  return SearchAllProductsUsecase(ref.watch(productRepositoryProvider));
});

final sortAllProductUseCaseProvider = Provider<SortAllProductsUsecase>((ref) {
  return SortAllProductsUsecase(ref.watch(productRepositoryProvider));
});

final productProvider =
    StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  return ProductNotifier(ref.watch(getProductUseCaseProvider));
});

final allProductsProvider =
    StateNotifierProvider<AllProductsNotifier, AllProductsState>((ref) {
  return AllProductsNotifier(
    ref.watch(getAllProductsUseCaseProvider),
    ref.watch(searchAllProductUseCaseProvider),
    ref.watch(sortAllProductUseCaseProvider),
  );
});
