import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;
  const ProductEntity({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.price = 0.0,
    this.image = '',
    this.category = '',
  });

  @override
  List<Object?> get props => [id, title, description, price, image, category];
}
