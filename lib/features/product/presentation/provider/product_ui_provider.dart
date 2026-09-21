import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ProductViewType { grid, list }

class ProductUIState {
  final ProductViewType viewType;
  final String searchQuery;
  final String selectedCategory;
  final double minPrice;
  final double maxPrice;
  final int minRating;
  final bool inStockOnly;
  final String sortBy;

  ProductUIState({
    this.viewType = ProductViewType.grid,
    this.searchQuery = '',
    this.selectedCategory = 'All',
    this.minPrice = 0,
    this.maxPrice = 2000,
    this.minRating = 0,
    this.inStockOnly = false,
    this.sortBy = 'Relevance',
  });

  ProductUIState copyWith({
    ProductViewType? viewType,
    String? searchQuery,
    String? selectedCategory,
    double? minPrice,
    double? maxPrice,
    int? minRating,
    bool? inStockOnly,
    String? sortBy,
  }) {
    return ProductUIState(
      viewType: viewType ?? this.viewType,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      minRating: minRating ?? this.minRating,
      inStockOnly: inStockOnly ?? this.inStockOnly,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}

class ProductUINotifier extends StateNotifier<ProductUIState> {
  ProductUINotifier() : super(ProductUIState());

  void setViewType(ProductViewType viewType) => state = state.copyWith(viewType: viewType);
  void setSearchQuery(String query) => state = state.copyWith(searchQuery: query);
  void setCategory(String category) => state = state.copyWith(selectedCategory: category);
  void setPriceRange(double min, double max) => state = state.copyWith(minPrice: min, maxPrice: max);
  void setRating(int rating) => state = state.copyWith(minRating: rating);
  void setInStock(bool inStock) => state = state.copyWith(inStockOnly: inStock);
  void setSortBy(String sortBy) => state = state.copyWith(sortBy: sortBy);
  
  void resetFilters() {
    state = state.copyWith(
      selectedCategory: 'All',
      minPrice: 0,
      maxPrice: 2000,
      minRating: 0,
      inStockOnly: false,
    );
  }
}

final productUIProvider = StateNotifierProvider<ProductUINotifier, ProductUIState>((ref) {
  return ProductUINotifier();
});
