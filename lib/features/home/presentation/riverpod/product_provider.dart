import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/product_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/product_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/product_usecase.dart';
import 'product_state.dart';
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

final productProvider =
    StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  return ProductNotifier(ref.watch(getProductUseCaseProvider));
});
