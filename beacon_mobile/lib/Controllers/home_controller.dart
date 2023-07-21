import 'package:beacon/Models/annonce_model.dart';
import 'package:beacon/Models/store_model.dart';
import 'package:beacon/Providers/home_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeProvider homeProvider;
  RxBool isAnnoncesLoaded = false.obs;
  RxBool isStoresLoaded = false.obs;
  var annonces = <AnnonceModel>[].obs;
  var stores = <StoreModel>[].obs;

  HomeController({required this.homeProvider});

  getAllAnnonces() async {
    isAnnoncesLoaded(true);
    await homeProvider.fetchAllAnnonces().then((result) {
      if (result.body != null) {
        annonces.value = result.body!;
      }
    });
    isAnnoncesLoaded(false);
  }

  getAllStores() async {
    isStoresLoaded(true);
    await homeProvider.fetchAllStores().then((result) {
      if (result.body != null) {
        stores.value = result.body!;
      }
    });
    isStoresLoaded(false);
  }

  @override
  void onInit() {
    getAllAnnonces();
    getAllStores();
    super.onInit();
  }
}
