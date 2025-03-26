import 'package:flutter/material.dart';
import 'package:honey_comp_dashboard/core/widgets/build_app_bar.dart';
import 'package:honey_comp_dashboard/core/widgets/custom_button.dart';
import 'package:honey_comp_dashboard/features/add_product/presentation/view/add_product_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static const routeName = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, title: "Admin Dashboard"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddProductView.routeName);
                },
                title: 'Add Product'),
          )
        ],
      ),
    );
  }
}
