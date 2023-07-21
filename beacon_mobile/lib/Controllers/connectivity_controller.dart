import 'dart:async';
import 'dart:io';
import 'package:beacon/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  RxBool hasConnection = false.obs;
  RxBool isStatusAppear = true.obs;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  listenToConnectionChanges() {
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if ((event == ConnectivityResult.wifi) ||
          (event == ConnectivityResult.mobile)) {
        checkConnectionStatus();
      } else if (event == ConnectivityResult.none) {
        isStatusAppear(true);
        hasConnection(false);
      }
    });
  }

  Future checkConnectionStatus() async {
    try {
      final res = await InternetAddress.lookup('google.com');
      hasConnection.value = res.isNotEmpty && res[0].rawAddress.isNotEmpty;

      if (hasConnection.value) {
        isStatusAppear(true);

        Future.delayed(const Duration(seconds: 3))
            .then((value) => isStatusAppear(false));
      } else {
        isStatusAppear(true);
      }
    } on SocketException catch (e) {
      isStatusAppear(true);
      hasConnection(false);
    }
  }

  @override
  void onInit() {
    checkConnectionStatus();
    listenToConnectionChanges();
    super.onInit();
  }
}
