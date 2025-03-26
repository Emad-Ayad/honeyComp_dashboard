import 'package:flutter/material.dart';
import 'package:honey_comp_dashboard/features/add_product/presentation/view/add_product_view.dart';
import 'package:honey_comp_dashboard/features/dashboard/presentation/view/dashboard_view.dart';

Route<dynamic> routerGenerator(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());

    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
