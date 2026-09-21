import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/network/network_provider.dart';
import '../../../dashboard/domain/model/product_model.dart';
import '../../data/repo/product_repository_impl.dart';
import '../../domain/repo/product_repository.dart';
import '../../domain/usecase/get_products_use_case.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final productDao = ref.watch(productDaoProvider);
  final dioClient = ref.watch(dioClientProvider);
  return ProductRepositoryImpl(productDao: productDao, dioClient: dioClient);
});

final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductsUseCase(productRepository: repository);
});

class ProductPaginationState {
  final List<ProductModel> products;
  final bool isLoading;
  final bool hasMore;
  final int skip;

  ProductPaginationState({
    this.products = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.skip = 0,
  });

  ProductPaginationState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
    bool? hasMore,
    int? skip,
  }) {
    return ProductPaginationState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      skip: skip ?? this.skip,
    );
  }
}

class ProductPaginationNotifier extends StateNotifier<ProductPaginationState> {
  final GetProductsUseCase _getProductsUseCase;
  static const int _limit = 20;

  ProductPaginationNotifier(this._getProductsUseCase) : super(ProductPaginationState()) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true);

    try {
      final newProducts = await _getProductsUseCase.execute(
        limit: _limit,
        skip: state.skip,
      );

      state = state.copyWith(
        products: [...state.products, ...newProducts],
        isLoading: false,
        skip: state.skip + _limit,
        hasMore: newProducts.length == _limit,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print("Error in pagination: $e");
    }
  }

  void reset() {
    state = ProductPaginationState();
    fetchProducts();
  }
}

final productPaginationProvider = StateNotifierProvider<ProductPaginationNotifier, ProductPaginationState>((ref) {
  final useCase = ref.watch(getProductsUseCaseProvider);
  return ProductPaginationNotifier(useCase);
});
