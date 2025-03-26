import 'package:flutter/material.dart';
import 'package:honey_comp_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:honey_comp_dashboard/core/widgets/image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _key,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: "Product Name",
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: "Product Price",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: "Product Code",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: "Product Description",
                keyboardType: TextInputType.number,
                maxLines: 5,
              ),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
