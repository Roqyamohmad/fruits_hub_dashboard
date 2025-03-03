import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manager/add_product_cubit.dart';

import '../../../../../core/helper_function/build_app_bar.dart';
import 'add_product_view_body.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailur) {
          buildAppBar(state.errMessage);
        }
        if (state is AddProductSuccess) {
          buildAppBar('Product added sucessfully');
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductLoading,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
