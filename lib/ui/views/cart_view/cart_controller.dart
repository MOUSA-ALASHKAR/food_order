import 'package:food_order/core/data/models/cart_model.dart';
import 'package:food_order/core/services/base_controller.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/checkout_view/checkout_view.dart';
import 'package:get/get.dart';

class CartController extends BaseController {
  List<CartModel> get cartList => cartService.cartList;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  void removeFromCart(CartModel model) {
    cartService.removeFromCart(
      model: model,
    );
  }

  void changeCount(bool increase, CartModel model) {
    cartService.changeCount(
      incress: increase,
      model: model,
    );
  }

  void checkout() {
    runFullLoadingFutureFunction(
        function: Future.delayed(Duration(seconds: 2)).then((value) {
          Get.off(CheckoutView());
        }));
  }
}