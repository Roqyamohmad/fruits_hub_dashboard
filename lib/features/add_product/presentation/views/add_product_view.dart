import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper_function/build_app_bar.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'addProductView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Product'),
      body: const AddProductViewBody(),
    );
  }
}
