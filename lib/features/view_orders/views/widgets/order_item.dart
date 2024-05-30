import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';


class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: IntrinsicWidth(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FancyShimmerImage(
                height: 100.h,
                width: 100.w,
                imageUrl: AppConstants.internetImagePath,
              ),
            ),
            horizontalSpace(10),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 194.w,
                            child: Text('Product title',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.font17BlackBoldWeight,
                            ),
                          ),
                          Text('\$ 50.00',style: AppStyles.font17BlueBoldWeight,),
                          Text('Qty: 10',style: AppStyles.font14GreyRegular,),
                        ],
                      ),
                      IconButton(onPressed: () {

                      }, icon: Icon(Icons.clear,color: Colors.red,)),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
