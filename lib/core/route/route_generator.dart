import 'package:dummyjson_riverpod_clean/core/route/route_names.dart';
import 'package:dummyjson_riverpod_clean/features/auth/presentation/pages/sign_in_page.dart';
import 'package:dummyjson_riverpod_clean/features/home/presentation/pages/categories_page.dart';
import 'package:dummyjson_riverpod_clean/features/home/presentation/pages/product_by_category_page.dart';
import 'package:dummyjson_riverpod_clean/features/user/presentation/user_info_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.signInPage:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case RouteNames.userInfoPage:
        return MaterialPageRoute(builder: (_) => const UserInfoPage());
      case RouteNames.categoriesPage:
        return MaterialPageRoute(builder: (_) => const CategoriesPage());
      case RouteNames.byCategoryPage:
        final categoryData = routeSettings.arguments as Map<String, String>;
        return MaterialPageRoute(
            builder: (_) => ProductByCategoryPage(data: categoryData));
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
