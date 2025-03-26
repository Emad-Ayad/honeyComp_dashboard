import 'package:flutter/material.dart';
import 'package:honey_comp_dashboard/core/helper/routes_generator.dart';
import 'package:honey_comp_dashboard/features/dashboard/presentation/view/dashboard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routerGenerator,
      initialRoute: DashboardView.routeName,
    );
  }
}
