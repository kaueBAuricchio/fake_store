import 'package:fake_store/list_products/presentation/riverpod/product_pagination_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListPage extends ConsumerStatefulWidget {
  const ProductListPage({super.key});

  @override
  ConsumerState<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final notifier = ref.read(productPaginationProvider.notifier);
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        notifier.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productPaginationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Produtos')),
      body: productsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erro: $err')),
        data: (products) => ListView.separated(
          controller: _scrollController,
          itemCount: products.length + 1,
          separatorBuilder: (_, __) => const Divider(height: 0),
          itemBuilder: (_, index) {
            if (index >= products.length) {
              final hasMore = ref
                  .read(productPaginationProvider.notifier)
                  .hasMore;

              return hasMore
                  ? const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : const SizedBox.shrink(); // Não mostra nada se não tem mais dados
            }

            final product = products[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: Image.network(
                  product.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                ),
                title: Text(product.title),
                subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
