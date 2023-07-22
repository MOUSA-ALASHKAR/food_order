import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_order/app/my_app_controller.dart';
import 'package:food_order/core/data/repositories/shared_preferences_repositories.dart';
import 'package:food_order/core/enums/connectivityStatus.dart';
import 'package:food_order/core/enums/message_type.dart';
import 'package:food_order/core/services/cart_service.dart';
import 'package:food_order/core/services/connectivity_service.dart';
import 'package:food_order/core/services/location_service.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

bool isEmail(String value){
  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(value);
}

bool isPassword(String value){
  String p = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(value);
}

double screenWidth(double percent) {
  return Get.size.width / percent ;
}

double screenHeight(double percent) {
  return Get.size.height / percent ;
}

SharedPreferencesRepositories get storage => Get.find<SharedPreferencesRepositories>();

CartService get cartService => Get.find<CartService>();

LocationService get locationService => Get.find<LocationService>();


void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
  return Container(
    width: screenWidth(5),
    height: screenWidth(5),
    decoration: BoxDecoration(
        color: AppColors.blackColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15)),
    child: SpinKitCircle(color: AppColors.mainOrangeColor),
  );
});


// void fadeInTransition(Widget view) {
//   Get.to(view, transition: Transition.fadeIn);
// }

double get taxAmount => 0.18;
double get deliveryAmount => 0.1;

bool get isOnline => Get.find<MyAppController>().connectionStatus == ConnectivityStatus.ONLINE;

ConnectivityService get connectivityService => Get.find<ConnectivityService>();

void checkConnection(Function function) {
  if (isOnline)
    function();
  else
    CustomToast.showMessage(
        message: 'Please check internet connection',
        messageType: MessageType.WARNING);
}

// void checkConnection(Function function) async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult != ConnectivityResult.none) {
//     function();
//   } else {
//     CustomToast.showMessage(
//       message: 'Please check internet connection',
//       messageType: MessageType.WARNING,
//     );
//   }
// }
