import 'package:dummyjson_riverpod_clean/features/home/domain/entities/all_products.dart';

abstract class ByCategoryState {}

class ByCategoryInitial extends ByCategoryState {}

class ByCategoryLoading extends ByCategoryState {}

class ByCategoryLoaded extends ByCategoryState {
  final AllProducts allProducts;

  ByCategoryLoaded(this.allProducts);
}

class ByCategoryError extends ByCategoryState {
  final String message;

  ByCategoryError(this.message);
}
