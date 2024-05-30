import 'package:flutter/material.dart';
import 'package:smart_shop_admin/features/app_dashboard/models.dart';
import 'package:smart_shop_admin/features/app_dashboard/views/widgets/app_dashboard_item.dart';

class AppDashBoardList extends StatelessWidget {
  const AppDashBoardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 1 / 1,
          children: List.generate(dashBoardList.length,
                  (index) =>
               AppDashBoardItem(model: dashBoardList[index],))
      ),
    );
  }
}
