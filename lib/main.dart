import 'core/data/repositories/shared_preferences_repositories.dart';
import 'package:food_order/core/services/connectivity_service.dart';
import 'package:food_order/core/services/location_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_order/app/my_app_controller.dart';
import 'core/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/my_app.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() async {
      var sharedPref = await SharedPreferences.getInstance();
      return sharedPref;
    },
  );

  Get.put(SharedPreferencesRepositories());
  Get.put(CartService());
  Get.put(LocationService());
  Get.put(ConnectivityService());
  Get.put(MyAppController());

  runApp(const MyApp());
}