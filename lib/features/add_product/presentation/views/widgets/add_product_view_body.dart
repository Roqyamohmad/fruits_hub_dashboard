import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruits_hub_dashboard/core/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/core/widgets/is_featured_check_box.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entities.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  bool isFeatured = false;
  late num price;
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
                  hintText: 'Product Name',
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    price = num.parse(value!);
                  },
                  hintText: 'Product Price',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    code = value!.toLowerCase();
                  },
                  hintText: 'Product Code',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    description = value!;
                  },
                  hintText: 'Product Description',
                  textInputType: TextInputType.text,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 16,
                ),
                IsFeaturedCheckBox(
                  onChanged: (value) {
                    isFeatured = value;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ImageField(
                  onFileChanged: (image) {
                    this.image = image;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomButton(
                    text: "Add Product",
                    onPressed: () {
                      if (image != null) {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          AddProductEntitites input = AddProductEntitites(
                              name: name,
                              code: code,
                              description: description,
                              image: image!,
                              isFeatured: isFeatured,
                              price: price);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      } else {
                        showBar(context, 'Please select an image');
                      }
                    }),
                const SizedBox(
                  height: 16,
                ),
              ],
            )),
      ),
    );
  }

  void showBar(BuildContext context, String massage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massage),
      ),
    );
  }
}
