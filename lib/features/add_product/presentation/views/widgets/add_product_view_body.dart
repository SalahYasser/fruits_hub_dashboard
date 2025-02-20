import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import 'image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
                textInputType: TextInputType.text,
                hintText: 'Product Name',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                textInputType: TextInputType.number,
                hintText: 'Product Price',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                textInputType: TextInputType.number,
                hintText: 'Product Code',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                maxLines: 5,
                textInputType: TextInputType.text,
                hintText: 'Product Description',
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(onChanged: (value) {}),
              SizedBox(height: 16),
              ImageField(onFileChanged: (image) {}),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
