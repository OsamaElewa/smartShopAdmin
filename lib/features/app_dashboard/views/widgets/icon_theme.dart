import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/local/cache_helper.dart';
import '../../../../config/theme_cubit/theme_cubit.dart';
import '../../../../config/theme_cubit/theme_state.dart';

class IconThemeSection extends StatelessWidget {
  const IconThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit , ThemeState>(
      builder: (context, state) {
        return  IconButton(
            onPressed: () => ThemeCubit.get(context).toggleTheme(),
            icon: Icon(
                CacheHelper.getData(key: 'isDark')!
                    ? Icons.light_mode
                    : Icons.dark_mode,
              color: CacheHelper.getData(key: 'isDark') ? Colors.white : Colors.black,
              size: 25.sp,
            )
        );
      },
    );
  }
}
