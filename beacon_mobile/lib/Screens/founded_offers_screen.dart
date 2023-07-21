import 'package:beacon/Components/app_bar_widget.dart';
import 'package:beacon/Components/bottom_nav_bar.dart';
import 'package:beacon/Components/offre_card.dart';
import 'package:beacon/Controllers/offer_controller.dart';
import 'package:beacon/Controllers/scan_controller.dart';
import 'package:beacon/Models/point_offre_model.dart';
import 'package:beacon/Screens/permission_needed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OffersFoundScreen extends StatelessWidget {
  OffersFoundScreen({Key? key}) : super(key: key);
  final controller = Get.find<ScanController>();
  final offreController = Get.find<OfferController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(55.h), // Set this height
            child: const AppBarWidget(
              title: 'Offers',
            ),
          ),
          floatingActionButton: !(controller.authorizationStatusOk.value)
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.white,
                  tooltip: 'This app need permission to access to location',
                  icon: const Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    controller.requestNeededPermission();
                  },
                  label: const Text(
                    'Authorize',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Ubuntu",
                    ),
                  ),
                )
              : null,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0x0fffffff),
            child: Obx(
              () {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!(controller.bluetoothEnabled.value &&
                    controller.authorizationStatusOk.value &&
                    controller.locationServiceEnabled.value)) {
                  return const NeedPermissionScreen();
                }

                if (controller.availableOffers.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (!controller.isScanPaused.value)
                          LinearProgressIndicator(
                            color: Colors.black,
                            minHeight: 5.h,
                            backgroundColor:
                                const Color.fromARGB(255, 198, 195, 195),
                          ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    await controller.refreshScanning();
                                  },
                                  icon: Icon(
                                    Icons.refresh,
                                    size: 35.sp,
                                  )),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Image.asset("images/sad.jpg"),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "No Offers Arround",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24.sp,
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                      ],
                    ),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (!controller.isScanPaused.value)
                      LinearProgressIndicator(
                        color: Colors.black,
                        minHeight: 5.h,
                        backgroundColor:
                            const Color.fromARGB(255, 198, 195, 195),
                      ),
                    SizedBox(
                      height: (controller.isScanPaused.value) ? 15.h : 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${controller.availableOffers.length} Offers Found !",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 23.h,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                            ),
                            child: (!controller.isScanPaused.value)
                                ? IconButton(
                                    onPressed: () async {
                                      await controller.stopScanBeacon();
                                    },
                                    icon: Icon(
                                      Icons.pause,
                                      size: 35.sp,
                                    ))
                                : IconButton(
                                    onPressed: () async {
                                      await controller.refreshScanning();
                                    },
                                    icon: Icon(
                                      Icons.refresh,
                                      size: 35.sp,
                                    )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.availableOffers.length,
                        itemBuilder: (context, index) => OffreCard(
                          offre: controller.availableOffers.elementAt(index),
                          onPressed: () async {
                            if (controller.availableOffers.elementAt(index)
                                is PointOffreModel) {
                              offreController.takePointOffer(controller
                                  .availableOffers
                                  .elementAt(index)
                                  .id!);
                            } else {
                              offreController.takeVoucher(controller
                                  .availableOffers
                                  .elementAt(index)
                                  .id!);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: BottomNavBar(
            currentIndex: 1,
          ));
    });
  }
}
