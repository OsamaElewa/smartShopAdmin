import 'package:flutter/material.dart';
import 'package:smart_shop_admin/features/view_orders/views/widgets/order_list.dart';

class ViewOrderBody extends StatelessWidget {
  const ViewOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const OrderList(),
    );
  }
}
