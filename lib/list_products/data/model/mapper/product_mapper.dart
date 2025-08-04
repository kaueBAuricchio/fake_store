import 'package:fake_store/list_products/data/model/product_model.dart';
import 'package:fake_store/list_products/domain/entity/product_entity.dart';

extension ProductMapper on ProductModel {
  ProductEntity toEntity() => ProductEntity(
    id: id,
    title: title,
    description: description,
    price: price,
    image: image,
    category: category,
  );
}

extension ListProductMapper on List<ProductModel> {
  List<ProductEntity> toListEntity() =>
      map((model) => model.toEntity()).toList();
}
