import 'package:dummyjson_riverpod_clean/features/home/domain/entities/all_products.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductByCategoryUsecase {
  final ProductRepository repository;

  GetProductByCategoryUsecase(this.repository);

  Future<AllProducts> call({required String url}) {
    return repository.getProductsByCategory(url: url);
  }
}
