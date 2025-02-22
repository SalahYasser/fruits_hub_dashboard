import 'dart:io';
import 'package:fruits_hub_dashboard/features/add_product/data/models/review_model.dart';

import '../../domain/entities/add_product_input/ProductEntity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final num sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.expirationMonths,
    required this.numOfCalories,
    required this.unitAmount,
    this.sellingCount = 0,
    this.isOrganic = false,
    this.imageUrl,
    required this.reviews,
  });

  factory ProductModel.fromEntity(
    ProductEntity addProductInputEntity,
  ) {
    return ProductModel(
      reviews: addProductInputEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      image: addProductInputEntity.image,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      expirationMonths: addProductInputEntity.expirationMonths,
      numOfCalories: addProductInputEntity.numOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
      isOrganic: addProductInputEntity.isOrganic,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'numOfCalories': numOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
