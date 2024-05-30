import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop_admin/config/theme_cubit/theme_cubit.dart';
import 'package:smart_shop_admin/core/widgets/app_name_text_widget.dart';
import 'package:smart_shop_admin/features/app_dashboard/views/logic/dashboard_cubit.dart';
import 'package:smart_shop_admin/features/app_dashboard/views/widgets/app_dashboard_body.dart';
import 'package:smart_shop_admin/features/app_dashboard/views/widgets/icon_theme.dart';

import '../../../config/local/cache_helper.dart';
import '../../../config/theme_cubit/theme_state.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_styles.dart';

class AppDashBoard extends StatelessWidget {
  const AppDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        actions: const [
          IconThemeSection()
        ],
      ),
      body: const AppDashBoardBody(),
    );
  }
}
