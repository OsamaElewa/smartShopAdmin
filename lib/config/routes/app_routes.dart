import 'package:flutter/material.dart';
import 'package:smart_shop_admin/core/animations/page_slide_transition.dart';
import 'package:smart_shop_admin/features/inspect_all_product/views/inspect_all_products.dart';
import 'package:smart_shop_admin/features/view_orders/views/view_order.dart';
import '../../core/animations/page_fade_transition.dart';
import '../../core/utils/app_strings.dart';
import '../../features/add_new_product/presentation/views/add_new_product.dart';
import '../../features/app_dashboard/views/app_dashboard.dart';
class Routes {
  static const String dashboardView = '/';
  static const String addNewProductView = '/add_new_product_view';
  static const String inspectAllProductView = '/inspect_all_product_view';
  static const String ordersView = '/orders_view';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dashboardView:
        return PageFadeTransition(
            page: const AppDashBoard(),
        );
      case Routes.addNewProductView:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page: AddNewProduct(),
        );
      case Routes.inspectAllProductView:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page: const InspectAllProduct(),
        );
      case Routes.ordersView:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page: const ViewOrders(),
        );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
