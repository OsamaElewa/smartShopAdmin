import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop_admin/core/helpers/spacing.dart';
import 'package:smart_shop_admin/core/utils/app_strings.dart';
import 'package:smart_shop_admin/core/utils/app_styles.dart';

import '../../logic/add_new_product_cubit.dart';


class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
            child: Image(
              image: FileImage(AddNewProductCubit.get(context).imageData!),
              height: 150.h,
              width: 150.w,
              fit: BoxFit.cover,
            ),
        ),
        verticalSpace(7),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {
              
            }, child: Text(
              AppStrings.pickImageTextButton,
              style: AppStyles.blueText,
            ),
            ),
            horizontalSpace(10),
            TextButton(onPressed: () {

            }, child: Text(
              AppStrings.removeImageTextButton,
              style: AppStyles.redText,
            ),
            ),
          ],
        )
      ],
    );
  }
}
