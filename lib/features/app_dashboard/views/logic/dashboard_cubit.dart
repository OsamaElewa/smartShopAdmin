import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_shop_admin/config/theme_cubit/theme_state.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitialState());

  static DashboardCubit get(context) => BlocProvider.of(context);
}