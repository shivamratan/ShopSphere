
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopsphere/features/dashboard/presentation/widget/dashboard_categories_section.dart';
import 'package:shopsphere/features/dashboard/presentation/widget/dashboard_header.dart';
import 'package:shopsphere/features/dashboard/presentation/widget/dashboard_populars_section.dart';

import '../widget/dashboard_featured_product.dart';

class DashboardScreen extends  ConsumerWidget{
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
                body: SingleChildScrollView(
                child: Column(
                  children: [
                    const DashboardHeader(),
                    const CategoriesSection(),
                    const FeaturedProductSection(),
                    const PopularProduct()
                   ],
                 ),
                ),
      ),
    );
  }

}