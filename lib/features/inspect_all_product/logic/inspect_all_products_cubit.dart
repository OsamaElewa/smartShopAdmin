import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop_admin/features/inspect_all_product/logic/inspect_all_products_state.dart';

import '../../add_new_product/models/product_model.dart';
class InspectAllProductsCubit extends Cubit<InspectAllProductsState>{
  InspectAllProductsCubit() : super(InspectAllProductsInitialState());


  static InspectAllProductsCubit get(context) => BlocProvider.of(context);

  var searchController = TextEditingController();

  void clear(){
    searchController.clear();
    emit(InspectAllProductsClearState());
  }
  void searchChanged(){
    emit(InspectAllProductsChangedState());
  }


  List<ProductModel> products1 = [];
  List<String> productsId = [];

  Stream<List<ProductModel>> getProducts1() {
    return FirebaseFirestore.instance
        .collection('products')
        .snapshots().map((snapShot) {
      products1 = [];
      for (var element in snapShot.docs) {

        products1.add(ProductModel.fromJson(element.data()));
      }
      return products1;

    });

    //     .listen((event) {
    //   products1 = [];
    //   event.docs.forEach((element) {
    //      products1.add(ProductModel.fromJson(element.data()));
    //   });
    //   emit(GetProductsSuccessStates());
    // });
    // return Stream.value(products1);
  }
}