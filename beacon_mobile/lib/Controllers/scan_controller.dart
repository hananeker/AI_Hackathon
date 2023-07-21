import 'dart:async';

import 'package:beacon/Models/beacon_model.dart';
import 'package:beacon/Models/offre_model.dart';
import 'package:beacon/Models/point_offre_model.dart';
import 'package:beacon/Models/voucher_model.dart';
import 'package:beacon/Providers/offre_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:permission_handler/permission_handler.dart' as permhandler;

class ScanController extends GetxController
    with StateMixin<List<VoucherModel>> {
  RxBool isOffersScreenActive = false.obs;
  RxBool isLoading = false.obs;

  StreamSubscription<RangingResult>? streamRanging;

  var availableOffers = <OffreModel>{}.obs;
  var bs = <BeaconModel>[].obs;

  Set<Beacon> beacons = {};

  final OffreProvider offreProvider;

  var isScanPaused = true.obs;

  ScanController({required this.offreProvider});

  RxBool bluetoothEnabled = false.obs;
  RxBool authorizationStatusOk = false.obs;
  RxBool locationServiceEnabled = false.obs;

  List<Region> regions = [];

  Future<void> checkRequirements() async {
    bool hasBlutooth = await permhandler.Permission.bluetooth.isGranted;
    bluetoothEnabled(hasBlutooth);
    bool gpsPerm = await permhandler.Permission.location.isGranted;
    authorizationStatusOk(gpsPerm);
    bool hasGpsService =
        await permhandler.Permission.location.serviceStatus.isEnabled;
    locationServiceEnabled(hasGpsService);
  }

  Future<void> requestNeededPermission() async {
    //request the incomplet permission

    if (!bluetoothEnabled.value) {
      final permissionStatus = await permhandler.Permission.bluetooth.request();
      bool isPermitted = permissionStatus.isGranted;
      bluetoothEnabled(isPermitted);
    }

    if (!authorizationStatusOk.value) {
      final permissionStatus = await permhandler.Permission.location.request();
      bool isGpsPermitted = permissionStatus.isGranted;
      authorizationStatusOk(isGpsPermitted);
    }
  }

  stopScanBeacon() async {
    try {
      streamRanging?.cancel();
      isScanPaused.value = true;
    } finally {}
  }

  resumeScanBeacon() async {
    try {
      streamRanging?.resume();
      isScanPaused.value = false;
    } finally {}
  }

  generateRegions() {
    regions = List.generate(
        bs.length,
        (index) => Region(
              identifier: bs.elementAt(index).identifier,
              proximityUUID: bs.elementAt(index).proximityUUID,
            ));
  }

  initScanBeacon() async {
    await flutterBeacon.initializeScanning;

    generateRegions();

    if (streamRanging != null) {
      if (streamRanging!.isPaused) {
        streamRanging?.resume();
        return;
      }
    }
    Set<OffreModel> offers = {};
    isScanPaused.value = false;
    streamRanging =
        flutterBeacon.ranging(regions).listen((RangingResult result) {
      beacons.addAll(result.beacons);
      generateRegions();

      offers.clear();
      for (Beacon beacon in beacons) {
        for (BeaconModel beaconModel in bs) {
          if (beaconModel.proximityUUID.toUpperCase() ==
              beacon.proximityUUID.toUpperCase()) {
            addOffers(beaconModel.offers, offers);
          }
        }
      }
      availableOffers(offers);
      beacons.clear();
    });
  }

  // getFakeOffers() {
  //   for (BeaconModel beaconModel in bs) {
  //     addOffers(beaconModel.offers);
  //   }
  // }

  removePointOffre(int idPointOffer) {
    for (OffreModel offre in availableOffers) {
      if ((offre is PointOffreModel) && (offre.id == idPointOffer)) {
        print('offre removed');
        availableOffers.remove(idPointOffer);
        break;
      }
    }
    print('offre not removed');
  }

  addOffers(List<OffreModel> offers, Set<OffreModel> result) {
    for (OffreModel offre in offers) {
      if (!result.contains(offre)) {
        result.add(offre);
      }
    }
  }

  refreshScanning() async {
    isLoading(true);
    if (streamRanging != null) streamRanging!.cancel();
    await offreProvider.fetchAllBeaconsWithOffers().then((result) {
      if (result.body != null) {
        bs.value = result.body!;
        generateRegions();
        initScanBeacon();
      }
    });
    isLoading(false);
  }

  bool globalState() {
    return bluetoothEnabled.value &&
        authorizationStatusOk.value &&
        locationServiceEnabled.value;
  }

  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    try {
      offreProvider.fetchAllBeaconsWithOffers().then((result) async {
        if (result.body != null) {
          bs.value = result.body!;
          await checkRequirements();
          await requestNeededPermission();

          flutterBeacon.bluetoothStateChanged().listen((bluetoothState) async {
            bluetoothEnabled(bluetoothState == BluetoothState.stateOn);
            if (bluetoothState == BluetoothState.stateOn) {
              if ((globalState()) && (isScanPaused.value == true)) {
                initScanBeacon();
              } else {
                if (streamRanging != null) streamRanging!.cancel();
                isScanPaused.value = true;
              }
            }
          });

          Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
            if (status == ServiceStatus.enabled) {
              locationServiceEnabled(true);
              if ((globalState()) && (isScanPaused.value == true)) {
                initScanBeacon();
              } else {
                if (streamRanging != null) streamRanging!.cancel();
                isScanPaused.value = true;
              }
            } else {
              locationServiceEnabled(false);
            }
          });

          flutterBeacon.authorizationStatusChanged().listen(
            (authState) async {
              authorizationStatusOk(
                  (authState == AuthorizationStatus.allowed) ||
                      (authState == AuthorizationStatus.always));
              if (authorizationStatusOk.value) {
                if ((globalState()) && (isScanPaused.value == true)) {
                  initScanBeacon();
                } else {
                  if (streamRanging != null) streamRanging!.cancel();
                  isScanPaused.value = true;
                }
              }
            },
          );
        }
      });
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    super.onClose();
    if (streamRanging != null) streamRanging!.cancel();
  }
}
