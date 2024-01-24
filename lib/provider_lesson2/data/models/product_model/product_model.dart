import 'package:project1/provider_lesson2/data/models/product_model/rating_model.dart';

class ProductModel {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  RatingModel rating;

  ProductModel({
    required this.title,
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title']??"",
      category: json['category']??"",
      description: json['description']??"",
      id: json['id']??0,
      image: json['image']??"",
      price: json['price']??"",
      rating: RatingModel.fromJson(json['rating']??{}),
    );
  }
}
