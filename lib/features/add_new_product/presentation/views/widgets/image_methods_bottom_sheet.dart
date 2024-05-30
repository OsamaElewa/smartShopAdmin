import 'package:flutter/material.dart';

import '../../../../../config/local/cache_helper.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../logic/add_new_product_cubit.dart';



class ImageMethodsBottomSheet extends StatelessWidget {
  const ImageMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
