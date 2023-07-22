import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/intro_view/intro_view.dart';
import 'package:food_order/ui/views/landing_view/landing_view.dart';
import 'package:food_order/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    if (storage.getOrderPlaced()) {
      cartService.clearCart();
      storage.setOrderPlaced(false);
    }
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (storage.getFirstLunch()) {
        Get.off(IntroView());
      } else {
        Get.off(storage.getLogIn() ? LandingView() : LandingView());
      }
      //Get.back();
      storage.setFirstLunch(false);
    });
    super.onInit();
  }
}