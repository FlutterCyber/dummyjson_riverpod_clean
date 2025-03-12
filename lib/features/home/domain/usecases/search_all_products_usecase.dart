import 'package:dummyjson_riverpod_clean/features/home/domain/entities/all_products.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';

class SearchAllProductsUsecase {
  final ProductRepository repository;

  SearchAllProductsUsecase(this.repository);

  Future<AllProducts> call({required String word}) {
    return repository.searchAllProducts(word: word);
  }
}
