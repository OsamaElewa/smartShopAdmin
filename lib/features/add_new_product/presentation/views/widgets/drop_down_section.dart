import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop_admin/core/utils/app_strings.dart';
import 'package:smart_shop_admin/core/utils/app_styles.dart';

import '../../../../../core/widgets/custom_dropdown.dart';
import '../../../models/drop_down_model.dart';
import '../../logic/add_new_product_cubit.dart';
import '../../logic/add_new_product_state.dart';


class DropDownSection extends StatelessWidget {
   const DropDownSection({super.key,});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AddNewProductCubit, AddNewProductState>(
      builder: (context, state) {
        // if (index!= null) {
        //   AddNewProductCubit.get(context).dropdownValue = dropDownItems[index!];
        // }
        return CustomDropdown(
          value: AddNewProductCubit.get(context).dropdownValue,
          title: AppStrings.selectCategoryText,
          hintText: AppStrings.selectCategoryText,
          messageForValidate: AppStrings.chooseCategoryText,
          items: List<DropdownMenuItem<CategoryModel>>.generate(
              dropDownItems.length,
                  (index) => DropdownMenuItem(
                  value: dropDownItems[index],
                  child: Text(
                    dropDownItems[index].name,
                    style: AppStyles.blackText,
                  ),
                  ),
          ),
          onChange: ( value) {
            AddNewProductCubit.get(context).changeDropDownValue(value) ;
          },
        );
      },

    );
  }
}
