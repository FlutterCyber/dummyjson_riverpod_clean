import 'package:dummyjson_riverpod_clean/features/home/data/models/product_model.dart';
import 'package:dummyjson_riverpod_clean/features/home/domain/entities/all_products.dart';

class AllProductsModel extends AllProducts {
  AllProductsModel({
    required super.products,
    required super.total,
    required super.skip,
    required super.limit,
  });

  factory AllProductsModel.fromJson(Map<String, dynamic> json) =>
      AllProductsModel(
        products: List<ProductModel>.from(
            json["products"].map((x) => ProductModel.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  // Map<String, dynamic> toJson() => {
  //   "products": List<dynamic>.from(products.map((x) => x.toJson())),
  //   "total": total,
  //   "skip": skip,
  //   "limit": limit,
  // };
}
