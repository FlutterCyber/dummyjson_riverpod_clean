import '../entities/product.dart';

abstract class ProductRepository {
  Future<Product> getSingleProduct({required int id});
}
