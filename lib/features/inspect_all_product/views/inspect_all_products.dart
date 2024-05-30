import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop_admin/config/local/cache_helper.dart';
import 'package:smart_shop_admin/core/utils/app_styles.dart';
import 'package:smart_shop_admin/features/inspect_all_product/views/widgets/inspect_all_products_list.dart';
import 'package:smart_shop_admin/features/inspect_all_product/views/widgets/search_section.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/utils/app_colors.dart';
import '../logic/inspect_all_products_cubit.dart';
import '../logic/inspect_all_products_state.dart';

class InspectAllProduct extends StatelessWidget {
  const InspectAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context)
            , icon: Icon(
          Icons.arrow_back_ios,
          color: CacheHelper.getData(key: 'isDark')?AppColors.white:AppColors.black,)),
        title: Text('Search',style: AppStyles.font17BlackBoldWeight,),
      ),
      body: BlocProvider(
        create: (context) => InspectAllProductsCubit()..getProducts1(),
        child: BlocBuilder<InspectAllProductsCubit , InspectAllProductsState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 17.h),
                child: Column(
                  children: [
                    const SearchSection(),
                    verticalSpace(15),
                    const InspectAllProductsList()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
