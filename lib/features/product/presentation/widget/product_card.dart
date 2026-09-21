import 'package:flutter/material.dart';
import '../../../dashboard/domain/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final bool isList;

  const ProductCard({super.key, required this.product, this.isList = false});

  @override
  Widget build(BuildContext context) {
    if (isList) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              _ProductImage(product: product, size: 100),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProductInfo(product: product),
                    const SizedBox(height: 8),
                    _ProductPrice(product: product),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _ProductImage(product: product)),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProductInfo(product: product),
                const SizedBox(height: 8),
                _ProductPrice(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final ProductModel product;
  final double? size;

  const _ProductImage({required this.product, this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Image.network(
              product.thumbnail,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported),
            ),
          ),
        ),
        if (product.discountPercentage > 0)
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '-${product.discountPercentage.round()}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        Positioned(
          top: 4,
          right: 4,
          child: IconButton(
            icon: const Icon(Icons.favorite_border, size: 20),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class _ProductInfo extends StatelessWidget {
  final ProductModel product;

  const _ProductInfo({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          product.category,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 14),
            const SizedBox(width: 4),
            Text(
              product.rating.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(width: 4),
            Text(
              '(120)', // Placeholder for review count
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProductPrice extends StatelessWidget {
  final ProductModel product;

  const _ProductPrice({required this.product});

  @override
  Widget build(BuildContext context) {
    final originalPrice = product.price / (1 - product.discountPercentage / 100);
    return Row(
      children: [
        Text(
          '\$${product.price.toStringAsFixed(0)}',
          style: TextStyle(
            color: Colors.green.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        if (product.discountPercentage > 0) ...[
          const SizedBox(width: 8),
          Text(
            '\$${originalPrice.toStringAsFixed(0)}',
            style: TextStyle(
              color: Colors.grey.shade500,
              decoration: TextDecoration.lineThrough,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}
