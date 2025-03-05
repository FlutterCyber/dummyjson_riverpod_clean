import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required int id,
    required String title,
    required String description,
    required String category,
    required double price,
    required double discountPercentage,
    required double rating,
    required int stock,
    required List<String> tags,
    required String brand,
    required String sku,
    required double weight,
    required Dimensions dimensions,
    required String warrantyInformation,
    required String shippingInformation,
    required String availabilityStatus,
    required List<Review> reviews,
    required String returnPolicy,
    required Meta meta,
    required List<String> images,
    required String thumbnail,
  }) : super(
    id: id,
    title: title,
    description: description,
    category: category,
    price: price,
    discountPercentage: discountPercentage,
    rating: rating,
    stock: stock,
    tags: tags,
    brand: brand,
    sku: sku,
    weight: weight,
    dimensions: dimensions,
    warrantyInformation: warrantyInformation,
    shippingInformation: shippingInformation,
    availabilityStatus: availabilityStatus,
    reviews: reviews,
    returnPolicy: returnPolicy,
    meta: meta,
    images: images,
    thumbnail: thumbnail,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      tags: List<String>.from(json['tags']),
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight'].toDouble(),
      dimensions: DimensionsModel.fromJson(json['dimensions']),
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews: (json['reviews'] as List)
          .map((review) => ReviewModel.fromJson(review))
          .toList(),
      returnPolicy: json['returnPolicy'],
      meta: MetaModel.fromJson(json['meta']),
      images: List<String>.from(json['images']),
      thumbnail: json['thumbnail'],
    );
  }
}


class DimensionsModel extends Dimensions {
  DimensionsModel({
    required double width,
    required double height,
    required double depth,
  }) : super(width: width, height: height, depth: depth);

  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      width: json['width'].toDouble(),
      height: json['height'].toDouble(),
      depth: json['depth'].toDouble(),
    );
  }
}


class ReviewModel extends Review {
  ReviewModel({
    required int rating,
    required String comment,
    required DateTime date,
    required String reviewerName,
    required String reviewerEmail,
  }) : super(
    rating: rating,
    comment: comment,
    date: date,
    reviewerName: reviewerName,
    reviewerEmail: reviewerEmail,
  );

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: json['rating'],
      comment: json['comment'],
      date: DateTime.parse(json['date']),
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}


class MetaModel extends Meta {
  MetaModel({
    required String createdAt,
    required String updatedAt,
    required String barcode,
    required String qrCode,
  }) : super(
    createdAt: createdAt,
    updatedAt: updatedAt,
    barcode: barcode,
    qrCode: qrCode,
  );

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      barcode: json['barcode'],
      qrCode: json['qrCode'],
    );
  }
}
