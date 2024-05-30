import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop_admin/core/functions/show_snack_bar.dart';
import 'package:smart_shop_admin/core/helpers/spacing.dart';
import 'package:smart_shop_admin/core/widgets/custom_loading.dart';
import 'package:smart_shop_admin/features/add_new_product/models/drop_down_model.dart';
import 'package:smart_shop_admin/features/add_new_product/presentation/views/widgets/pick_product_image_section.dart';
import 'package:smart_shop_admin/features/add_new_product/presentation/views/widgets/product_image_network.dart';
import 'package:smart_shop_admin/features/add_new_product/presentation/views/widgets/product_image_section.dart';
import 'package:smart_shop_admin/features/add_new_product/presentation/views/widgets/text_field_section.dart';

import 'package:smart_shop_admin/features/inspect_all_product/product_model.dart';

import '../../../models/product_model.dart';
import '../../logic/add_new_product_cubit.dart';
import '../../logic/add_new_product_state.dart';
import 'clear_and_upload_section.dart';
import 'drop_down_section.dart';



class AddNewProductBody extends StatelessWidget {
   AddNewProductBody({super.key , this.model});

   ProductModel? model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewProductCubit , AddNewProductState>(
      listener: (context, state) {
        if (state is CreateProductSuccessState) {
          showSuccessSnackBar(context: context, message: 'Product created successfully');
        }
        if (state is CreateProductErrorState) {
          showErrorSnackBar(context: context, message: 'Failed to create product');
        }
        if (state is ChangeEditingState) {
          AddNewProductCubit.get(context).isEditing = false;}
        if (model != null) {
          AddNewProductCubit.get(context).dropdownValue = dropDownItems[model!.productCategory!];
        }
      },
      builder: (context, state) {
        if (model !=null) {
          AddNewProductCubit.get(context).dropdownValue = dropDownItems[model!.productCategory!];
          AddNewProductCubit.get(context).isEditing = true;
        }
        return CustomLoading(
          isLoading: state is CreateProductLoadingState,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddNewProductCubit.get(context).isEditing && AddNewProductCubit.get(context).imageData == null?
                  ProductImageNetwork(image: model!.productImage)
                      : AddNewProductCubit.get(context).isEditing && AddNewProductCubit.get(context).imageData != null?
                  const ProductImageSection():
                  AddNewProductCubit.get(context).imageData == null ?
                  const PickProductImageSection()
                      : const ProductImageSection(),
                  verticalSpace(10),
                  const DropDownSection(),
                  // DropdownButton(
                  //   //dropdownColor: Colors.grey,
                  //   style: TextStyle(color: CacheHelper.getData(key: 'isDark')? AppColors.white : AppColors.black),
                  //   borderRadius: BorderRadius.circular(12),
                  //   underline:  Container(),
                  //   hint: Text('select category',style: TextStyle(color: CacheHelper.getData(key: 'isDark')? AppColors.white : AppColors.black),),
                  //   value: AddNewProductCubit.get(context).dropdownValue,
                  //     items: List<DropdownMenuItem<DropDownModel>>.generate(
                  //         dropDownItems.length,
                  //             (index) => DropdownMenuItem(
                  //               value: dropDownItems[index],
                  //                 child: Text(dropDownItems[index].name,style: TextStyle(color: AppColors.black),))
                  //     ),
                  //     onChanged: (DropDownModel? value) {
                  //       AddNewProductCubit.get(context).changeDropDownValue(value) ;
                  //     },),
                  verticalSpace(10),
                  TextFieldSection(model: model,),
                  verticalSpace(10),
                  ClearAndUploadSection(model: model,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
