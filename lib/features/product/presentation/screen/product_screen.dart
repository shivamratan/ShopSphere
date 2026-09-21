import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/product_provider.dart';
import '../provider/product_ui_provider.dart';
import '../widget/product_card.dart';
import '../widget/product_filter_dialog.dart';
import '../widget/product_sort_dialog.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(productPaginationProvider.notifier).fetchProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(productUIProvider);
    final uiNotifier = ref.read(productUIProvider.notifier);
    final paginationState = ref.watch(productPaginationProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildSearchBar(uiNotifier),
            _buildCategoryChips(uiState, uiNotifier),
            _buildActionButtons(context, uiState, uiNotifier),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                '${paginationState.products.length} products displayed',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ),
            Expanded(
              child: _buildProductList(paginationState, uiState),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(ProductPaginationState state, ProductUIState uiState) {
    if (state.products.isEmpty && state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.products.isEmpty && !state.isLoading) {
      return const Center(child: Text('No products found'));
    }

    final itemCount = state.products.length + (state.hasMore ? 1 : 0);

    if (uiState.viewType == ProductViewType.grid) {
      return GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index == state.products.length) {
            return const Center(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ));
          }
          return ProductCard(product: state.products[index]);
        },
      );
    } else {
      return ListView.builder(
        controller: _scrollController,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index == state.products.length) {
            return const Center(child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ));
          }
          return ProductCard(
            product: state.products[index],
            isList: true,
          );
        },
      );
    }
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Products',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(ProductUINotifier uiNotifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        onChanged: uiNotifier.setSearchQuery,
        decoration: InputDecoration(
          hintText: 'Search products...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChips(ProductUIState uiState, ProductUINotifier uiNotifier) {
    final categories = ['All', 'Beauty', 'Fragrances', 'Furniture', 'Groceries'];
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = uiState.selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) uiNotifier.setCategory(category);
              },
              selectedColor: Colors.green.shade700,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionButtons(
      BuildContext context, ProductUIState uiState, ProductUINotifier uiNotifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const ProductFilterDialog(),
                );
              },
              icon: const Icon(Icons.filter_list),
              label: const Text('Filter'),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const ProductSortDialog(),
                );
              },
              icon: const Icon(Icons.swap_vert),
              label: const Text('Sort'),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(
                uiState.viewType == ProductViewType.grid ? Icons.grid_view : Icons.list,
                color: Colors.green.shade700,
              ),
              onPressed: () {
                uiNotifier.setViewType(
                  uiState.viewType == ProductViewType.grid
                      ? ProductViewType.list
                      : ProductViewType.grid,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
