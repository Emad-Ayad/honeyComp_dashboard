import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp_dashboard/core/helper/routes_generator.dart';
import 'package:honey_comp_dashboard/core/services/get_it.dart';
import 'package:honey_comp_dashboard/features/dashboard/presentation/view/dashboard_view.dart';

import 'core/services/bloc_observer_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = BlocObserverService();
  setup();
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
