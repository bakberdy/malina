import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String name;
  final String description;
  final int price;
  final String pictureUrl;
  final String category;
  final bool isFood;

  const ProductModel({
    required this.category,
    required this.isFood,
    required this.name,
    required this.description,
    required this.price,
    required this.pictureUrl,
  });

  // Convert ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "pictureUrl": pictureUrl,
      "category": category,
      "isFood": isFood,
    };
  }

  // Create ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"],
      description: json["description"],
      price: json["price"],
      pictureUrl: json["pictureUrl"],
      category: json["category"],
      isFood: json["isFood"],
    );
  }

  @override
  List<Object> get props => [name, description, price, pictureUrl, category, isFood];
}
