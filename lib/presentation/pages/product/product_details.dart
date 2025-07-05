import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda/presentation/pages/product/controller/product_details/product_controller.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productDetailProvider(productId));

    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: productAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text(err.toString())),
        data: (product) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'product_${product.id}',
                child: CachedNetworkImage(
                  imageUrl: product.thumbnail,
                  height: 250,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.broken_image),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                product.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Wrap(
                children: [
                  Text(
                    'Category: ${product.category}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Brand: ${product.brand}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'SKU: ${product.sku}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Weight: ${product.weight}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Stock: ${product.stock}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Rating: ${product.rating}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Discount: ${product.discountPercentage}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Return Policy: ${product.returnPolicy}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                product.description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
