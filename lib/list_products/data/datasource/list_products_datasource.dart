import 'package:fake_store/list_products/data/model/product_model.dart';

abstract class IListProductsDatasource {
  Future<List<ProductModel>> listProducts();
}
