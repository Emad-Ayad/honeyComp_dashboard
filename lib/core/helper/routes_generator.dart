import 'package:flutter/material.dart';
import 'package:honey_comp_dashboard/features/dashboard/presentation/view/dashboard_view.dart';


Route<dynamic> routerGenerator(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
