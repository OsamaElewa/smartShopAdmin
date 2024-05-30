import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../../config/local/cache_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../add_new_product/models/product_model.dart';
import '../../../add_new_product/presentation/views/add_new_product.dart';

class InspectAllProductsItem extends StatelessWidget {
  const InspectAllProductsItem({super.key, required this.model});

  final ProductModel? model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewProduct(model: model,),
      )
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:CacheHelper.getData(key: 'isDark')!? AppColors.lightPrimary : AppColors.grey200,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FancyShimmerImage(
              height: 100.h,
              width: double.infinity,
              imageUrl: model!.productImage!,
              boxFit: BoxFit.cover,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: Text(model!.productTitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.font17BlackBoldWeight,
                      ),
                    ),
                    Spacer(),
                    const Icon(Icons.favorite_border)
                  ],
                ),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${model!.productPrice}'),
                    const Icon(Icons.shopping_cart)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
