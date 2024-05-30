import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_divider.dart';
import 'order_item.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => const OrderItem(),
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CustomDivider(),
              ),
              itemCount: 5
          ),
        ),
      ],
    );
  }
}
