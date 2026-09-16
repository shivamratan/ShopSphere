
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopsphere/features/dashboard/domain/repo/dashboard_repository.dart';
import 'package:shopsphere/features/dashboard/domain/usecase/get_all_product_category_use_case.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/network/network_provider.dart';
import '../../data/repo/dashboard_repository_impl.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
    final productCategoryDao = ref.watch(productCategoryDaoProvider);
    final dioClient = ref.watch(dioClientProvider);
    return DashboardRepositoryImpl(productCategoryDao: productCategoryDao, dioClient: dioClient);
});

final getAllProductCategoryUseCaseProvider = Provider<GetAllProductCategoryUseCase>((ref) {
    final dashboardRepositor = ref.watch(dashboardRepositoryProvider);
   return GetAllProductCategoryUseCase(dashboardRepository: dashboardRepositor);
});

final productCategoriesFutureProvider  = FutureProvider((ref) {
   final getAllProductCategoryUseCaseFuture = ref.watch(getAllProductCategoryUseCaseProvider);
   return getAllProductCategoryUseCaseFuture.execute();
});