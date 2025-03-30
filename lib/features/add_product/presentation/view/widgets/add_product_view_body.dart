import 'dart:io';

import 'package:flutter/material.dart';
import 'package:honey_comp_dashboard/core/widgets/custom_button.dart';
import 'package:honey_comp_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:honey_comp_dashboard/core/widgets/image_field.dart';
import 'package:honey_comp_dashboard/features/add_product/domain/add_product_input_entity.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isChecked = false;
  late String name, code, description;
  late num price;
  File? image;

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
                onSaved: (value) {
                  name = value!;
                },
                hintText: "Product Name",
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: "Product Price",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: "Product Code",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: "Product Description",
                keyboardType: TextInputType.number,
                maxLines: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Is Featured Product ?"),
                  Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                ],
              ),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                  onPressed: () {
                    if (image != null) {
                      if (_key.currentState!.validate()) {
                        _key.currentState!.save();
                        AddProductInputEntity input = AddProductInputEntity(
                            name: name,
                            code: code,
                            description: description,
                            isFeatured: isChecked,
                            price: price);
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please Add an image ")));
                    }
                  },
                  title: "Add Product"),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
