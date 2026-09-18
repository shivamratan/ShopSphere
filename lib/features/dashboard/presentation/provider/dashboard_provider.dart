
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopsphere/features/dashboard/domain/repo/dashboard_repository.dart';
import 'package:shopsphere/features/dashboard/domain/usecase/get_all_product_category_use_case.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/network/network_provider.dart';
import '../../data/repo/dashboard_repository_impl.dart';
import '../../domain/usecase/get_all_feature_product_use_case.dart';
import '../../domain/usecase/get_all_popular_product_use_case.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {

    final productCategoryDao = ref.watch(productCategoryDaoProvider);
    final featureProductDao = ref.watch(featureProductDaoProvider);
    final popularProductDao = ref.watch(popularProductDaoProvider);
    final dioClient = ref.watch(dioClientProvider);

    return DashboardRepositoryImpl(productCategoryDao: productCategoryDao,
        featureProductDao: featureProductDao,
        popularProductDao: popularProductDao,
        dioClient: dioClient
    );

});

final getAllProductCategoryUseCaseProvider = Provider<GetAllProductCategoryUseCase>((ref) {
    final dashboardRepositor = ref.watch(dashboardRepositoryProvider);
   return GetAllProductCategoryUseCase(dashboardRepository: dashboardRepositor);
});

final productCategoriesFutureProvider  = FutureProvider((ref) {
   final getAllProductCategoryUseCaseFuture = ref.watch(getAllProductCategoryUseCaseProvider);
   return getAllProductCategoryUseCaseFuture.execute();
});

final getAllFeatureProductUseCaseProvider = Provider<GetAllFeatureProductUseCase>((ref) {
    final dashboardRepositor = ref.watch(dashboardRepositoryProvider);
   return GetAllFeatureProductUseCase(dashboardRepository: dashboardRepositor);
});

final featureProductsFutureProvider  = FutureProvider((ref) {
   final getAllFeatureProductUseCaseFuture = ref.watch(getAllFeatureProductUseCaseProvider);
   return getAllFeatureProductUseCaseFuture.execute();
});

final getAllPopularProductUseCaseProvider = Provider<GetAllPopularProductUseCase>((ref) {
    final dashboardRepositor = ref.watch(dashboardRepositoryProvider);
   return GetAllPopularProductUseCase(dashboardRepository: dashboardRepositor);
});

final popularProductsFutureProvider  = FutureProvider((ref) {
   final getAllPopularProductUseCaseFuture = ref.watch(getAllPopularProductUseCaseProvider);
   return getAllPopularProductUseCaseFuture.execute();
});