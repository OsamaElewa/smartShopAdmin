import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop_admin/core/utils/app_strings.dart';
import 'package:smart_shop_admin/core/utils/app_styles.dart';

import '../../../../../config/local/cache_helper.dart';
import '../../../../../core/functions/show_image_methods_bottom_sheet.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../logic/add_new_product_cubit.dart';
import '../../logic/add_new_product_state.dart';


class ProductImageNetwork extends StatelessWidget {
  const ProductImageNetwork({super.key, required this.image});

  final String? image;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewProductCubit , AddNewProductState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(image!),
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
                }, child: Text(
                  AppStrings.pickImageTextButton,
                  style: AppStyles.blueText,
                )
                ),
                horizontalSpace(10),
                TextButton(onPressed: () {

                }, child: Text(
                  AppStrings.removeImageTextButton,
                  style: AppStyles.redText,
                )
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
