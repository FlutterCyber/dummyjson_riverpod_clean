import 'package:dummyjson_riverpod_clean/features/home/domain/entities/all_products.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetAllProductsUsecase {
  final ProductRepository repository;

  GetAllProductsUsecase(this.repository);

  Future<AllProducts> call() {
    return repository.getAllProducts();
  }
}
