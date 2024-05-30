import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop_admin/core/utils/app_strings.dart';
import 'package:smart_shop_admin/core/utils/app_styles.dart';

import '../../../../../config/local/cache_helper.dart';
import '../../../../../core/functions/show_image_methods_bottom_sheet.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../logic/add_new_product_cubit.dart';


class PickProductImageSection extends StatelessWidget {
  const PickProductImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showImageMethodsBottomSheet(context: context, content: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(5),
              Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                    color: AppColors.grey, borderRadius: BorderRadius.circular(10)),
              ),
              verticalSpace(5),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.transparent,
                    elevation: 0
                ),
                onPressed: () {
                  AddNewProductCubit.get(context).getCameraImage();
                  //RegisterCubit.get(context).emit(RegisterImageState());
                  //Navigator.pop(context);
                },
                label: Text(
                  AppStrings.cameraText,
                  style: TextStyle(color: CacheHelper.getData(key: 'isDark')!?
                  AppColors.white
                      :
                  AppColors.black),),
                icon: Icon(
                    Icons.camera,
                    color: CacheHelper.getData(key: 'isDark')!?
                    AppColors.white
                        :
                    AppColors.black
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.transparent,
                    elevation: 0
                ),
                onPressed: () {
                  AddNewProductCubit.get(context).getGalleryImage();
                  //Navigator.pop(context);
                },
                label: Text(
                  AppStrings.galleryText,
                  style: TextStyle(color: CacheHelper.getData(key: 'isDark')!?
                  AppColors.white
                      :
                  AppColors.black
                  ),
                ),
                icon: Icon(
                    Icons.photo_album_outlined,
                    color: CacheHelper.getData(key: 'isDark')!?
                    AppColors.white
                        :
                    AppColors.black),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.transparent,
                    elevation: 0
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                label: Text(
                  AppStrings.removeText,
                  style: TextStyle(color: CacheHelper.getData(key: 'isDark')!?
                  AppColors.white
                      :
                  AppColors.black
                  ),
                ),
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: AppColors.red,),
              ),
            ],
          ),
        ));
      },
      child: SizedBox(
        height: 150.h,
        width: 150.w,
        child: DottedBorder(
            color: CacheHelper.getData(key: 'isDark')?AppColors.white:AppColors.black,
            strokeWidth: 1,
            //dashPattern: [5, 5],
            //radius: Radius.circular(10),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.image_outlined,
                    color: AppColors.primary1,
                    size: 80.sp,
                  ),
                  Text(
                    AppStrings.pickProductImageText,
                    style: AppStyles.blueText,),
                ],
              ),
            )
        ),
      ),
    );
  }
}
