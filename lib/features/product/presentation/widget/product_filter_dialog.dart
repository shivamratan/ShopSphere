import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/product_ui_provider.dart';

class ProductFilterDialog extends ConsumerWidget {
  const ProductFilterDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(productUIProvider);
    final uiNotifier = ref.read(productUIProvider.notifier);

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
                'Filter Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 16),
          const Text('Categories', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              'All', 'Beauty', 'Fragrances', 'Furniture', 'Groceries', 
              'Home Decoration', 'Laptops', 'Mens Fashion', 'Smartphones', 
              'Sports', 'Tops', 'Vehicle', 'Womens Fashion'
            ].map((category) {
              final isSelected = uiState.selectedCategory == category;
              return ChoiceChip(
                label: Text(category),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) uiNotifier.setCategory(category);
                },
                selectedColor: Colors.green.shade700,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Price Range', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('\$${uiState.minPrice.round()} - \$${uiState.maxPrice.round()}'),
            ],
          ),
          RangeSlider(
            values: RangeValues(uiState.minPrice, uiState.maxPrice),
            min: 0,
            max: 2000,
            activeColor: Colors.green.shade700,
            onChanged: (values) {
              uiNotifier.setPriceRange(values.start, values.end);
            },
          ),
          const SizedBox(height: 24),
          const Text('Minimum Rating', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5, (index) {
              return IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  index < uiState.minRating ? Icons.star : Icons.star_border,
                  color: index < uiState.minRating ? Colors.green.shade700 : Colors.grey,
                ),
                onPressed: () => uiNotifier.setRating(index + 1),
              );
            }),
          ),
          const SizedBox(height: 24),
          const Text('Availability', style: TextStyle(fontWeight: FontWeight.bold)),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('In stock only'),
            value: uiState.inStockOnly,
            activeColor: Colors.green.shade700,
            onChanged: (val) => uiNotifier.setInStock(val ?? false),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => uiNotifier.resetFilters(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Reset'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Apply (120)'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
