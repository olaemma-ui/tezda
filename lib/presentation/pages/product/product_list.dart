import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tezda/core/enums/app_routes_enum.dart';
import 'package:tezda/core/states/favorites/favorite_controller.dart';
import 'package:tezda/presentation/pages/product/controller/product_list/product_list_controller.dart';
import 'package:tezda/presentation/widgets/product_card.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productListProvider);
    final favorites = ref.watch(favoriteProvider);
    final favoriteNotifier = ref.read(favoriteProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: RefreshIndicator(
        onRefresh: () => ref.read(productListProvider.notifier).fetchProducts(),
        child: productsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(err.toString()),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(productListProvider.notifier).fetchProducts(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          data: (products) {
            if (products.isEmpty) {
              return const Center(child: Text('No products found.'));
            }
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (_, i) {
                final product = products[i];
                return ProductCard(
                  product: product,
                  isFavorite: favorites.contains(product.id),
                  onFavoriteToggle: () =>
                      favoriteNotifier.toggleFavorite(product.id),
                  onTap: () =>
                      context.go('${AppRoute.products.path}/${product.id}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
