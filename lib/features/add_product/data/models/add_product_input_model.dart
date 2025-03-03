import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entities.dart';

class AddProductModels {
  final String name, code, description;
  final bool isFeatured;
  final num price;
  final File image;
  String? imageUrl;
  AddProductModels(
      {required this.name,
      required this.code,
      required this.description,
      required this.image,
      required this.isFeatured,
      required this.price,
      this.imageUrl});

  factory AddProductModels.fromEntity(AddProductEntitites addProductEntitites) {
    return AddProductModels(
      name: addProductEntitites.name,
      code: addProductEntitites.code,
      description: addProductEntitites.description,
      price: addProductEntitites.price,
      imageUrl: addProductEntitites.imageUrl,
      isFeatured: addProductEntitites.isFeatured,
      image: addProductEntitites.image,
    );
  }
  tojson() {
    return {
      name: name,
      code: code,
      description: description,
      price: price,
      imageUrl: imageUrl,
      isFeatured: isFeatured,
    };
  }
}
