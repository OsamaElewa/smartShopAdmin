import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/app_styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.image, required this.title});

  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
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
              image: AssetImage(image,),
              height: 100.h,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            verticalSpace(8),
            FittedBox(
              child: IntrinsicWidth(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(title,
                    style: AppStyles.font17BlackBoldWeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
