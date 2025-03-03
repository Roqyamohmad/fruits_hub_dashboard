import 'dart:io';

class AddProductEntitites {
  final String name, code, description;
  final bool isFeatured;
  final num price;
  final File image;
  String? imageUrl;
  AddProductEntitites(
      {required this.name,
      required this.code,
      required this.description,
      required this.image,
      required this.isFeatured,
      required this.price,
      this.imageUrl});
}
