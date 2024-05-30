import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop_admin/core/utils/app_strings.dart';
import 'package:smart_shop_admin/features/add_new_product/presentation/views/widgets/add_new_product_body.dart';
import 'package:smart_shop_admin/features/inspect_all_product/product_model.dart';


import '../../../../config/local/cache_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../models/product_model.dart';
import '../logic/add_new_product_cubit.dart';
import '../logic/add_new_product_state.dart';


class AddNewProduct extends StatelessWidget {
   AddNewProduct({super.key, this.model});
   ProductModel? model;

  bool isEditing = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewProductCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context)
              , icon: Icon(
            Icons.arrow_back_ios,
            color: CacheHelper.getData(key: 'isDark')?AppColors.white:AppColors.black,)),
          title: BlocBuilder<AddNewProductCubit, AddNewProductState>(
            builder: (context, state) {
              if (model != null) {
                isEditing = true;
              }
              return Text(
                isEditing ? AppStrings.editProductText
                    : AppStrings.uploadProductText,
                style: AppStyles.font17BlackBoldWeight,
              );
            },
          ),
        ),
        body:  AddNewProductBody(model: model,),
      ),
    );
  }
}
