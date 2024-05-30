import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop_admin/core/utils/app_strings.dart';
import 'package:smart_shop_admin/features/inspect_all_product/product_model.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../models/drop_down_model.dart';
import '../../../models/product_model.dart';
import '../../logic/add_new_product_cubit.dart';
import '../../logic/add_new_product_state.dart';



class TextFieldSection extends StatefulWidget {
   TextFieldSection({super.key, this.model});

  ProductModel? model;

  @override
  State<TextFieldSection> createState() => _TextFieldSectionState();
}

class _TextFieldSectionState extends State<TextFieldSection> {

  @override
  void initState() {
    // TODO: implement initState
    if (widget.model != null) {
      AddNewProductCubit.get(context).productTitleController.text = widget.model!.productTitle!;
      AddNewProductCubit.get(context).productDescriptionController.text = widget.model!.productDescription!;
      AddNewProductCubit.get(context).qtyController.text = widget.model!.productQuantity.toString();
      AddNewProductCubit.get(context).priceController.text = widget.model!.productPrice.toString();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewProductCubit, AddNewProductState>(
      listener: (context, state) {
        // if (widget.model != null){
        //   AddNewProductCubit.get(context).productTitleController.text = widget.model!.productTitle!;
        //   AddNewProductCubit.get(context).productDescriptionController.text = widget.model!.productDescription!;
        //   AddNewProductCubit.get(context).qtyController.text = widget.model!.productQuantity.toString();
        //   AddNewProductCubit.get(context).priceController.text = widget.model!.productPrice.toString();
        //   AddNewProductCubit.get(context).dropdownValue = dropDownItems[widget.model!.productCategory!];
        // }
      },
      builder: (context, state) {
        // if (widget.model !=null) {
        //   AddNewProductCubit.get(context).productTitleController.text = widget.model!.productTitle!;
        //   AddNewProductCubit.get(context).productDescriptionController.text = widget.model!.productDescription!;
        //   AddNewProductCubit.get(context).priceController.text = widget.model!.productPrice.toString();
        //   AddNewProductCubit.get(context).qtyController.text = widget.model!.productQuantity.toString();
        //
        // }
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              controller: AddNewProductCubit.get(context).productTitleController,
              validator: (p0) {

              },
              onChanged: (value){
                AddNewProductCubit.get(context).productTitleController.text = value!;
              },
              title: AppStrings.productTitleText,
              hintText: AppStrings.productTitleText,
              maxLines: 2,
              minLines: 1,
              maxLength: 80,

            ),
            verticalSpace(10),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    title: AppStrings.priceText,
                    hintText: AppStrings.priceText,
                    textInputType: const TextInputType.numberWithOptions(
                      decimal: true,
                      //signed: true
                    ),
                    controller: AddNewProductCubit.get(context).priceController,
                    validator: (p0) {

                    },
                    onChanged: (value){
                      AddNewProductCubit.get(context).priceController.text = value!;
                    },
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: CustomTextField(
                    title: AppStrings.qtyText,
                    hintText: AppStrings.qtyText,
                    textInputType: TextInputType.number,
                    controller: AddNewProductCubit.get(context).qtyController,
                    validator: (p0) {

                    },
                    onChanged: (value){
                      AddNewProductCubit.get(context).qtyController.text = value!;
                    },
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            CustomTextField(
              title: AppStrings.productDescriptionText,
              hintText: AppStrings.productDescriptionText,
              textInputType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              controller: AddNewProductCubit.get(context).productDescriptionController,
              validator: (p0) {

              },
              onChanged: (value){
                AddNewProductCubit.get(context).productDescriptionController.text = value!;
              },
              maxLines: 8,
              minLines: 5,
              maxLength: 1200,

            )
          ],
        );
      },
    );
  }
}
