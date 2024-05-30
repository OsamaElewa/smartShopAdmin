import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart_shop_admin/core/widgets/title_text_widget.dart';

import '../utils/app_strings.dart';


class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, this.fontSize});

  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      period: const Duration(seconds: 5),
        child: TitleTextWidget(label: AppStrings.appNameText,fontSize: fontSize,));
  }
}
