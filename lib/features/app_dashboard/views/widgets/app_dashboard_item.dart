import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop_admin/config/routes/app_routes.dart';
import 'package:smart_shop_admin/config/theme_cubit/theme_cubit.dart';
import 'package:smart_shop_admin/core/helpers/spacing.dart';
import 'package:smart_shop_admin/features/app_dashboard/models.dart';

import '../../../../config/local/cache_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class AppDashBoardItem extends StatelessWidget {
  const AppDashBoardItem({super.key, required this.model});

  final DashBoardModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.r),
      onTap: () {
        if (model.id == 1) {
          Navigator.pushNamed(context, Routes.addNewProductView);
        }

      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage(model.image,),
                height: 100.h,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              verticalSpace(8),
              FittedBox(
                child: IntrinsicWidth(
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(model.title,
                      style: AppStyles.font17BlackBoldWeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
