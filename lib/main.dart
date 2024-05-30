import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop_admin/smart_shop_admin_app.dart';

import 'config/bloc_observer.dart';
import 'config/local/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  Platform.isAndroid ?
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBdcu1ofgS1bpcLGkYnGMy01WO8KZoMW_M',
        appId: '1:17474594596:android:54f5a512f8b9e885eaf5b1',
        projectId: 'smart-shop-eda60',
        messagingSenderId: '17474594596',
        storageBucket: 'smart-shop-eda60.appspot.com',
      )
  )
      : await Firebase.initializeApp();
  await CacheHelper.init();
  if(CacheHelper.getData(key: 'isDark') == null){
    CacheHelper.saveData(key: 'isDark', value: false);
  }
  runApp(const SmartShopAdminApp());
}
