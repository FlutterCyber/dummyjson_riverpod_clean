import 'package:dummyjson_riverpod_clean/features/home/domain/entities/product.dart';

class AllProducts {
  List<Product> products;
  int total;
  int skip;
  int limit;

  AllProducts({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });
}
