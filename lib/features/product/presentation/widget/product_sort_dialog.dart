import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/product_ui_provider.dart';

class ProductSortDialog extends ConsumerWidget {
  const ProductSortDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(productUIProvider);
    final uiNotifier = ref.read(productUIProvider.notifier);

    final sortOptions = [
      {'title': 'Relevance', 'subtitle': 'Recommended for you'},
      {'title': 'Price: Low to High', 'subtitle': 'Cheapest first'},
      {'title': 'Price: High to Low', 'subtitle': 'Most expensive first'},
      {'title': 'Highest Rated', 'subtitle': 'Top rated products'},
      {'title': 'Newest First', 'subtitle': 'Latest products'},
      {'title': 'Name (A - Z)', 'subtitle': 'Alphabetical order'},
      {'title': 'Name (Z - A)', 'subtitle': 'Reverse alphabetical order'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sort Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 8),
          ...sortOptions.map((option) {
            final isSelected = uiState.sortBy == option['title'];
            return RadioListTile<String>(
              value: option['title']!,
              groupValue: uiState.sortBy,
              title: Text(option['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(option['subtitle']!),
              activeColor: Colors.green.shade700,
              onChanged: (val) {
                if (val != null) uiNotifier.setSortBy(val);
              },
            );
          }),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Apply'),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
