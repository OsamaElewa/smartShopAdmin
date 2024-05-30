class CategoryModel {
  int id;
  String name;
  CategoryModel({required this.id, required this.name});
}
List<CategoryModel> dropDownItems = [
  CategoryModel(id: 1, name: 'phones'),
  CategoryModel(id: 2, name: 'electronics'),
  CategoryModel(id: 3, name: 'watches'),
  CategoryModel(id: 4, name: 'clothes'),
  CategoryModel(id: 5, name: 'laptops'),
  CategoryModel(id: 6, name: 'cosmetics'),
  CategoryModel(id: 7, name: 'shoes'),
];