import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp_dashboard/core/repoes/product_repo/products_repo.dart';
import 'package:honey_comp_dashboard/core/services/get_it.dart';
import 'package:honey_comp_dashboard/core/widgets/build_app_bar.dart';
import 'package:honey_comp_dashboard/features/add_product/presentation/manger/cubit/add_product_cubit.dart';
import 'package:honey_comp_dashboard/features/add_product/presentation/view/widgets/add_product_view_body.dart';
import 'package:honey_comp_dashboard/features/add_product/presentation/view/widgets/add_product_view_body_builder.dart';

import '../../../../core/repoes/upload_image_repo/upload_img_repo.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, title: "Add Products"),
      body: BlocProvider(
        create: (context) =>
            AddProductCubit(getIt.get<ImageRepo>(), getIt.get<ProductsRepo>()),
        child: AddProductViewBodyBuilder(),
      ),
    );
  }
}


