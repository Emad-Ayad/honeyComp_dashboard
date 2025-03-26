import 'package:flutter/material.dart';
import 'package:honey_comp_dashboard/core/widgets/build_app_bar.dart';
import 'package:honey_comp_dashboard/features/add_product/presentation/view/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName='add-product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, title: "Add Products"),
      body: AddProductViewBody(),
    );
  }
}
