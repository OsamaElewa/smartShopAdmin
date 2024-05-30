import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_shop_admin/config/theme_cubit/theme_state.dart';

import '../local/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitialState());

  static ThemeCubit get(context) => BlocProvider.of(context);
  bool isDark = CacheHelper.getData(key: 'isDark') ?? false;



  void toggleTheme() {
    isDark = !isDark;
    CacheHelper.saveData(key: 'isDark', value: isDark);
    print(CacheHelper.getData(key: 'isDark'));
    emit(ThemeChangedState());
  }
}