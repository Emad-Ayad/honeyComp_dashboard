import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp_dashboard/core/widgets/custom_button.dart';
import 'package:honey_comp_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:honey_comp_dashboard/core/widgets/image_field.dart';
import 'package:honey_comp_dashboard/features/add_product/data/models/review_model.dart';
import 'package:honey_comp_dashboard/features/add_product/domain/add_product_input_entity.dart';
import 'package:honey_comp_dashboard/features/add_product/domain/review_entity.dart';
import 'package:honey_comp_dashboard/features/add_product/presentation/manger/cubit/add_product_cubit.dart';

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
  late int expirationMonths, numOfCalories, unitAmount;
  bool isOrganic = false;

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
                  unitAmount = int.parse(value!);
                },
                hintText: "Product Unit Amount",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  numOfCalories = int.parse(value!);
                },
                hintText: "Product Num Of Calories",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  expirationMonths = int.parse(value!);
                },
                hintText: "Product Expiration Months",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Is This Product Organic ?"),
                  Checkbox(
                      value: isOrganic,
                      onChanged: (value) {
                        setState(() {
                          isOrganic = value!;
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
                            price: price,
                            image: image!,
                            unitAmount: unitAmount,
                            numOfCalories: numOfCalories,
                            expirationMonths: expirationMonths,
                            isOrganic: isOrganic,
                            reviews: [
                              ReviewEntity(
                                  name: 'Omda',
                                  image:
                                      'https://mawasem-eg.com/wp-content/uploads/2021/05/%D8%B9%D8%B3%D9%84-%D8%B3%D8%AF%D8%B1.jpg',
                                  date: DateTime.now().toIso8601String(),
                                  ratting: 5,
                                  review: "Nice one")
                            ]);
                        context.read<AddProductCubit>().addProduct(input);
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
