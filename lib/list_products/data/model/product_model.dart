import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;

  const ProductModel({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.price = 0.0,
    this.image = '',
    this.category = '',
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
      category: map['category'] ?? '',
    );
  }

  static List<ProductModel> fromListMap(List maps) {
    return maps.map((map) => ProductModel.fromJson(map)).toList();
  }

  @override
  List<Object?> get props => [id, title, description, price, image, category];
}
