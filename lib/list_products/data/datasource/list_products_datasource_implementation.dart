import 'package:dio/dio.dart';
import 'package:fake_store/core/error/failure.dart';
import 'package:fake_store/list_products/data/datasource/list_products_datasource.dart';
import 'package:fake_store/list_products/data/model/product_model.dart';

class ListProductsDatasourceImplementation implements IListProductsDatasource {
  final Dio dio;

  ListProductsDatasourceImplementation(this.dio);

  @override
  Future<List<ProductModel>> listProducts() async {
    final String url = 'https://fakestoreapi.com/products';
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return ProductModel.fromListMap(response.data);
      } else {
        throw Exception('Failed to load products');
      }
    } on DataPostFailure catch (e) {
      throw DataPostFailure(message: e.message, statusCode: e.statusCode);
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
