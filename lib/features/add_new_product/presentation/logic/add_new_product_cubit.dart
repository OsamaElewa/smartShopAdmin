import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:smart_shop_admin/features/add_new_product/models/drop_down_model.dart';
import 'package:smart_shop_admin/features/add_new_product/models/product_model.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/local/cache_helper.dart';
import 'add_new_product_state.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddNewProductCubit extends Cubit<AddNewProductState> {
  AddNewProductCubit() : super(AddNewProductInitialState());

  static AddNewProductCubit get(context) => BlocProvider.of(context);

  var productTitleController = TextEditingController();
  var priceController = TextEditingController();
  var qtyController = TextEditingController();
  var productDescriptionController = TextEditingController();


  bool isEditing = false;

  CategoryModel? dropdownValue ;

  File? imageData;
  Future<void> getCameraImage()async{
    isEditing = false;
    final ImagePicker picker=ImagePicker();
    XFile? image =await picker.pickImage(source: ImageSource.camera);
    if(image!=null){
      var selected=File(image.path);
      CacheHelper.saveData(key: 'productImage', value: image.path);
      imageData=selected;
      emit(AddNewProductImageState());
      print(imageData!.path);
      print(imageData!.absolute);
      print(imageData!);
      print('yes');
      emit(ChangeEditingState());
    }else{
      print('No');
    }
  }

  Future<void> getGalleryImage()async{
    final ImagePicker picker=ImagePicker();
    XFile? image =await picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      var selected=File(image.path);
      CacheHelper.saveData(key: 'productImage', value: image.path);
      emit(AddNewProductImageState());
      imageData=selected;
      print(imageData!.path);
      print(imageData!.absolute);
      print(imageData!);
      print('yes');
    }else{
      print('No');
    }
  }

  void changeDropDownValue(CategoryModel? value) {
    dropdownValue = value;
    emit(AddNewProductDropDownValueState());
  }


  void uploadProductImage() {
    emit(CreateProductLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('products/${Uri.file(imageData!.path).pathSegments.last}')
        .putFile(imageData!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        final productId = const Uuid().v4();
        createProduct(
          productId: productId,
          productTitle: productTitleController.text,
          productDescription: productDescriptionController.text,
          productPrice: priceController.text,
          productCategory: dropdownValue!.id,
          productQuantity: int.parse(qtyController.text),
          productImage: value,
          createdAt: Timestamp.now(),
        );
        print(value);
      }).catchError((error) {
        emit(CreateProductErrorState());
      });
    }).catchError((error) {
      emit(CreateProductErrorState());
    });
  }
  void createProduct({
    required String productId,
    required String productTitle,
    required String productDescription,
    required String productPrice,
    required int productCategory,
    required int productQuantity,
    required String productImage,
    required Timestamp createdAt,
  }) {
    emit(CreateProductLoadingState());
    ProductModel model = ProductModel(
        productId: productId,
        productTitle: productTitle,
        productDescription: productDescription,
        productPrice: productPrice,
        productCategory: productCategory,
        productQuantity: productQuantity,
        productImage: productImage,
        createdAt: createdAt,
    );

    FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .set(model.toMap())
        .then((value) {

      emit(CreateProductSuccessState());
    }).catchError((error) {
      emit(CreateProductErrorState());
    });
  }


  void updateProductImage({required String productId , required String productImage}) {
    emit(CreateProductLoadingState());
    if (imageData != null) {
      firebase_storage.FirebaseStorage.instance
          .ref()
          .child('products/${Uri.file(imageData!.path).pathSegments.last}')
          .putFile(imageData!)
          .then((value) {
        value.ref.getDownloadURL().then((value) {
          updateProduct(
            productId: productId,
            productTitle: productTitleController.text,
            productDescription: productDescriptionController.text,
            productPrice: priceController.text,
            productCategory: dropdownValue!.id,
            productQuantity: int.parse(qtyController.text),
            productImage: value,
            createdAt: Timestamp.now(),
          );
          print(value);
        }).catchError((error) {
          emit(CreateProductErrorState());
        });
      }).catchError((error) {
        emit(CreateProductErrorState());
      });
    } else{
      updateProduct(
        productId: productId,
        productTitle: productTitleController.text,
        productDescription: productDescriptionController.text,
        productPrice: priceController.text,
        productCategory: dropdownValue!.id,
        productQuantity: int.parse(qtyController.text),
        productImage: productImage,
        createdAt: Timestamp.now(),
      );
    }

  }
  void updateProduct({
    required String productId,
    required String productTitle,
    required String productDescription,
    required String productPrice,
    required int productCategory,
    required int productQuantity,
    required String productImage,
    required Timestamp createdAt,
  }) {
    emit(CreateProductLoadingState());
    ProductModel model = ProductModel(
      productId: productId,
      productTitle: productTitle,
      productDescription: productDescription,
      productPrice: productPrice,
      productCategory: productCategory,
      productQuantity: productQuantity,
      productImage: productImage,
      createdAt: createdAt,
    );

    FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .update(model.toMap())
        .then((value) {

      emit(CreateProductSuccessState());
    }).catchError((error) {
      emit(CreateProductErrorState());
    });
  }
}