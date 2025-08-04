import 'package:fake_store/list_products/presentation/riverpod/riverpod_provider.dart';
import 'package:fake_store/list_products/domain/entity/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listProductsProvider = FutureProvider<List<ProductEntity>>((ref) async {
  final repository = ref.watch(listProductsRepositoryProvider);
  final result = await repository.listProducts();

  return result.fold((failure) => throw failure, (products) => products);
});
