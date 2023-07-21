import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class InfoScreenController extends GetxController {
  CarouselController carouselController = CarouselController();

  RxDouble scrollValue = 0.0.obs;

  void onScrolled(double? value) {
    scrollValue.value = (value ?? 10000) % 10000;
  }
}
