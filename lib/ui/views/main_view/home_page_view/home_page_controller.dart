import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:food_order/core/data/models/apis/category_model.dart';
import 'package:food_order/core/data/models/apis/meal_model.dart';
import 'package:food_order/core/data/repositories/category_repository.dart';
import 'package:food_order/core/data/repositories/meal_repository.dart';
import 'package:food_order/core/enums/Operation_type.dart';
import 'package:food_order/core/enums/message_type.dart';
import 'package:food_order/core/enums/request_status.dart';
import 'package:food_order/core/services/base_controller.dart';
import 'package:food_order/ui/shared/custom_widgets/custom_toast.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:get/get.dart';


class HomePageController extends BaseController {


  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<MealModel> mealList = <MealModel>[].obs;

  bool get isCategoryLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          listType.contains(OperationType.CATEGORY);

  bool get isMealLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          listType.contains(OperationType.MEAL);


  @override
  void onInit() {

    getAllCategory();
    getAllMeal();
    super.onInit();
  }

  void getAllCategory() {
    runLoadingFutureFunction(
        type: OperationType.CATEGORY,
        function: CategoryRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            categoryList.addAll(r);
          });
        }));
  }
  void getAllMeal() {
    runLoadingFutureFunction(
        type: OperationType.MEAL,
        function: MealRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            mealList.addAll(r);
          });
        }));
  }

  void addToCart(MealModel model) {
    cartService.addToCart(
        model: model,
        count: 1,
        afterAdd: () {
          CustomToast.showMessage(
              message: 'Added', messageType: MessageType.SUCCESS);
        });
  }

}