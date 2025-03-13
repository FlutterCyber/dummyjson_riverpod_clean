import 'package:dummyjson_riverpod_clean/features/home/domain/entities/all_products.dart';
import 'package:dummyjson_riverpod_clean/features/home/domain/entities/categories.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Product> getSingleProduct({required int id}) {
    return remoteDataSource.getSingleProduct(id: id);
  }

  @override
  Future<AllProducts> getAllProducts() {
    return remoteDataSource.getAllProducts();
  }

  @override
  Future<AllProducts> searchAllProducts({required String word}) {
    return remoteDataSource.searchAllProducts(word: word);
  }

  @override
  Future<AllProducts> sortAllProducts(
      {required String sortName, required String ascDesc}) {
    return remoteDataSource.sortAllProducts(
        sortName: sortName, ascDesc: ascDesc);
  }

  @override
  Future<List<Category>> getCategories() {
    return remoteDataSource.getCategories();
  }
}
