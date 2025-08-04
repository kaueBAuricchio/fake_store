import 'package:fake_store/list_products/domain/repository/list_products_implementation_repository.dart';
import 'package:dio/dio.dart';
import 'package:fake_store/list_products/data/datasource/list_products_datasource.dart';
import 'package:fake_store/list_products/data/datasource/list_products_datasource_implementation.dart';
import 'package:fake_store/list_products/domain/repository/list_products_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final listProductsDatasourceProvider = Provider<IListProductsDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return ListProductsDatasourceImplementation(dio);
});

final listProductsRepositoryProvider = Provider<IListProductsRepository>((ref) {
  final datasource = ref.watch(listProductsDatasourceProvider);
  return ListProductsImplementationRepository(datasource);
});
