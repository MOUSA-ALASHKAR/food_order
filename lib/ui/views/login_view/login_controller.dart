import 'package:flutter/material.dart';
import 'package:food_order/core/data/repositories/user_repository.dart';
import 'package:food_order/core/enums/message_type.dart';
import 'package:food_order/core/services/base_controller.dart';
import 'package:food_order/ui/shared/custom_widgets/custom_toast.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  TextEditingController emailController = TextEditingController(text: 'mousa.tma.it@gmail.com');
  TextEditingController passwordController = TextEditingController(text: 'mousa2000IT');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  void login() {
    // if (formKey.currentState!.validate()) {
      runFullLoadingFutureFunction(
          function: UserRepository().login(
              email: emailController.text,
              password: passwordController.text)
              .then((value) {
            value.fold((l) {
              CustomToast.showMessage(
                  message: l, messageType: MessageType.REJECTED);
            }, (r) {
              storage.setLogIn(true);
              storage.setTokenInfo(r);
              Get.off(MainView(), transition: Transition.cupertino);
            });
          }));
    // }
  }
}