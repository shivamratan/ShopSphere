
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopsphere/features/dashboard/domain/model/product_category_model.dart';
import 'package:shopsphere/features/dashboard/presentation/provider/dashboard_provider.dart';

class CategoriesSection extends ConsumerWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryAsyncValue = ref.watch(productCategoriesFutureProvider);

    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text('See'),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
          categoryAsyncValue.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text('Error: ${error.toString()}'),
            ),
            data: (categories) {
              if (categories.isEmpty) {
                return const Center(child: Text('No categories found'));
              }

              return SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final ProductCategoryModel productCategoryModel = categories[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(label: Text(productCategoryModel.category)),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}