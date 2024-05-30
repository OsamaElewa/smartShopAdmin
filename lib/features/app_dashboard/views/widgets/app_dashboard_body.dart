import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop_admin/config/theme_cubit/theme_cubit.dart';
import 'package:smart_shop_admin/config/theme_cubit/theme_state.dart';
import 'package:smart_shop_admin/core/utils/app_assets.dart';
import 'package:smart_shop_admin/core/utils/app_strings.dart';
import 'package:smart_shop_admin/features/app_dashboard/views/logic/dashboard_cubit.dart';
import 'package:smart_shop_admin/features/app_dashboard/views/widgets/app_dashboard_list.dart';
import 'package:smart_shop_admin/features/app_dashboard/views/widgets/custom_card.dart';

import '../../../../config/local/cache_helper.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';
import '../logic/dashboard_state.dart';

class AppDashBoardBody extends StatelessWidget {
  const AppDashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit , ThemeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15.r),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.addNewProductView);
                        },
                        child: CustomCard(image: AppAssets.addProductImage, title: AppStrings.addNewProduct)),
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15.r),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.inspectAllProductView);
                      },
                      child: CustomCard(
                          image: AppAssets.shoppingCartImage,
                          title: AppStrings.inspectAllProducts),
                    ),
                  ),
                ],
              ),
              verticalSpace(10),
              InkWell(
                  borderRadius: BorderRadius.circular(15.r),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.ordersView);
                  },
                  child: CustomCard(image: AppAssets.orderImage, title: AppStrings.viewOrders))
            ],
          ),
        );
      },
    );
  }
}
