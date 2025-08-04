import 'package:fake_store/list_products/presentation/riverpod/riverpod_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fake_store/list_products/domain/entity/product_entity.dart';

final productPaginationProvider =
    StateNotifierProvider<
      ProductPaginationNotifier,
      AsyncValue<List<ProductEntity>>
    >((ref) => ProductPaginationNotifier(ref));

class ProductPaginationNotifier
    extends StateNotifier<AsyncValue<List<ProductEntity>>> {
  ProductPaginationNotifier(this.ref) : super(const AsyncLoading()) {
    _fetchInitial();
  }

  final Ref ref;
  final int _limit = 10;
  int _page = 0;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  final List<ProductEntity> _products = [];

  bool get hasMore => _hasMore;

  Future<void> _fetchInitial() async {
    final repo = ref.read(listProductsRepositoryProvider);
    final result = await repo.listProductsPaginated(_page, _limit);
    result.fold((failure) => state = AsyncError(failure, StackTrace.current), (
      list,
    ) {
      _products.addAll(list);
      state = AsyncData([..._products]);
    });
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;
    _isLoadingMore = true;
    _page++;

    final repo = ref.read(listProductsRepositoryProvider);
    final result = await repo.listProductsPaginated(_page, _limit);
    result.fold((failure) => state = AsyncError(failure, StackTrace.current), (
      list,
    ) {
      if (list.isEmpty) {
        _hasMore = false;
      } else {
        _products.addAll(list);
        state = AsyncData([..._products]);
      }
    });

    _isLoadingMore = false;
  }
}
