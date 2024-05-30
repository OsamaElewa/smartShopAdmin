import 'package:flutter/material.dart';
import 'package:smart_shop_admin/config/local/cache_helper.dart';
import 'package:smart_shop_admin/features/view_orders/views/widgets/view_order_body.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class ViewOrders extends StatelessWidget {
  const ViewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context),
            icon: Icon(
            Icons.arrow_back_ios,
          color: CacheHelper.getData(key: 'isDark')?AppColors.white:AppColors.black,
        )
        ),
        title: Text('Placed Orders',style: AppStyles.font17BlackBoldWeight,),
      ),
      body: const ViewOrderBody(),
    );
  }
}
