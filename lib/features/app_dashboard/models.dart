import 'package:smart_shop_admin/core/utils/app_assets.dart';

class DashBoardModel {
  int id;
  String title;
  String image;
  DashBoardModel({required this.title, required this.image, required this.id});
}

List<DashBoardModel> dashBoardList = [
  DashBoardModel(title: 'Add new Product', image: AppAssets.addProductImage, id: 1),
  DashBoardModel(title: 'Inspect all Products', image: AppAssets.shoppingCartImage, id: 2),
  DashBoardModel(title: 'View orders', image: AppAssets.orderImage, id: 3),
];