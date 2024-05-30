import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop_admin/core/utils/app_strings.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../models/product_model.dart';
import '../../logic/add_new_product_cubit.dart';
import '../../logic/add_new_product_state.dart';



class ClearAndUploadSection extends StatelessWidget {
  ClearAndUploadSection({super.key,this.model});

  ProductModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder <AddNewProductCubit, AddNewProductState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.red),
                      foregroundColor: MaterialStateProperty.all(AppColors.white),
                    ),
                    onPressed: () {

                    }, icon: const Icon(Icons.clear),
                    label: const Text(AppStrings.clearTextButton)),
              ),
              horizontalSpace(10),
              Expanded(
                flex: 3,
                child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.primary),
                      foregroundColor: MaterialStateProperty.all(AppColors.white),
                    ),
                    onPressed: () {
                      model != null ? AddNewProductCubit.get(context).updateProductImage(productId: model!.productId!, productImage: model!.productImage!) : AddNewProductCubit.get(context).uploadProductImage();
                    }, icon: Icon(model != null ? Icons.update : Icons.upload),
                    label: Text( model != null ? AppStrings.updateTextButton : AppStrings.uploadTextButton)),
              ),
            ],
          ),
        );
      },
    );
  }
}
