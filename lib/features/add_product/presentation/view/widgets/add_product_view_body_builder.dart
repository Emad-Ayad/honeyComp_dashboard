import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp_dashboard/core/widgets/build_snack_bar.dart';
import 'package:honey_comp_dashboard/features/add_product/presentation/manger/cubit/add_product_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'add_product_view_body.dart';

class AddProductViewBodyBuilder extends StatelessWidget {
  const AddProductViewBodyBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if(state is AddProductSuccess){
          buildSnackBar(context, "Success");
        }else if(state is AddProductFailure){
          buildSnackBar(context, state.errMsg);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is AddProductLoading,
            child: AddProductViewBody());
      },
    );
  }
}