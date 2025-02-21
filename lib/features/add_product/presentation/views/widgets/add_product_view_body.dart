import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input/add_product_input_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review/review_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manger/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import 'image_field.dart';
import 'is_organic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, expirationMonths, numOfCalories, unitAmount;
  bool isFeatured = false;
  bool isOrganic = false;
  File? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                textInputType: TextInputType.text,
                hintText: 'Product Name',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                textInputType: TextInputType.number,
                hintText: 'Product Price',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  expirationMonths = num.parse(value!);
                },
                textInputType: TextInputType.number,
                hintText: 'Expiration Months',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  numOfCalories = num.parse(value!);
                },
                textInputType: TextInputType.number,
                hintText: 'Num Of Calories',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  unitAmount = num.parse(value!);
                },
                textInputType: TextInputType.number,
                hintText: 'Unit Amount',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                textInputType: TextInputType.number,
                hintText: 'Product Code',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                maxLines: 5,
                textInputType: TextInputType.text,
                hintText: 'Product Description',
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              SizedBox(height: 16),
              IsOrganicCheckBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              SizedBox(height: 16),
              SizedBox(height: 24),
              CustomButton(
                text: 'Add Product',
                onPressed: () {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      AddProductInputEntity input = AddProductInputEntity(
                        reviews: [
                          ReviewEntity(
                            name: 'Salah',
                            image:
                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fbeautiful%2F&psig=AOvVaw19xjUBre0RXfV2IZ-cEAEV&ust=1726749821993000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPCJ3L_CzIgDFQAAAAAdAAAAABAE',
                            rating: 5,
                            date: DateTime.now().toIso8601String(),
                            reviewDescription: 'Nice product',
                          )
                        ],
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        isFeatured: isFeatured,
                        image: image!,
                        isOrganic: isOrganic,
                        expirationMonths: expirationMonths.toInt(),
                        numOfCalories: numOfCalories.toInt(),
                        unitAmount: unitAmount.toInt(),
                      );

                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context);
                  }
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Please select an image')));
  }
}
