import 'package:food_order/core/enums/connectivityStatus.dart';
import 'package:food_order/core/services/base_controller.dart';
import 'package:food_order/ui/shared/utils.dart';

class MyAppController extends BaseController {

  ConnectivityStatus connectionStatus = ConnectivityStatus.ONLINE;

  @override
  void onInit() {
    listenToConnectionStatus();
    super.onInit();
  }

  void listenToConnectionStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      connectionStatus = event;
    });
  }
}