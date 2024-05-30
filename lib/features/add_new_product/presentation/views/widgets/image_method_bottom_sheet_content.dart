// import 'package:flutter/material.dart';
// import 'package:smart_shop_admin/features/add_new_product/views/logic/add_new_product_cubit.dart';
//
// import '../../../../config/local/cache_helper.dart';
// import '../../../../core/helpers/spacing.dart';
// import '../../../../core/utils/app_colors.dart';
//
// class ImageMethodBottomSheetContent extends StatelessWidget {
//   const ImageMethodBottomSheetContent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           verticalSpace(5),
//           Container(
//             height: 5,
//             width: 50,
//             decoration: BoxDecoration(
//                 color: AppColors.grey, borderRadius: BorderRadius.circular(10)),
//           ),
//           verticalSpace(5),
//           ElevatedButton.icon(
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.transparent,
//                 elevation: 0
//             ),
//             onPressed: () {
//               AddNewProductCubit.get(context).getCameraImage();
//               //RegisterCubit.get(context).emit(RegisterImageState());
//               //Navigator.pop(context);
//             },
//             label: Text('Camera',style: TextStyle(color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black),),
//             icon: Icon(Icons.camera,color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black),
//           ),
//           ElevatedButton.icon(
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.transparent,
//                 elevation: 0
//             ),
//             onPressed: () {
//               AddNewProductCubit.get(context).getGalleryImage();
//               //Navigator.pop(context);
//             },
//             label: Text('Gallery',style: TextStyle(color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black),),
//             icon: Icon(Icons.photo_album_outlined,color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black),
//           ),
//           ElevatedButton.icon(
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.transparent,
//                 elevation: 0
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             label: Text('Remove',style: TextStyle(color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black),),
//             icon: Icon(Icons.remove_circle_outline,color: AppColors.red,),
//           ),
//         ],
//       ),
//     );
//   }
// }
