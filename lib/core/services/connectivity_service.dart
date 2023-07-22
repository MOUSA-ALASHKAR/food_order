import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:food_order/core/enums/connectivityStatus.dart';
import 'dart:async';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectivityStatusController =
  StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity connectivity = Connectivity();
    connectivity.onConnectivityChanged.listen((event) {
      connectivityStatusController.add(getStatus(event));
    });
  }

  ConnectivityStatus getStatus(ConnectivityResult value) {
    switch (value) {
      case ConnectivityResult.bluetooth:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.ethernet:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.mobile:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.vpn:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.other:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.none:
        return ConnectivityStatus.OFFLINE;
    }
  }
}
