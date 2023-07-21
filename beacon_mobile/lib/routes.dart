import 'package:beacon/Bindings/home_binding.dart';
import 'package:beacon/Bindings/info_scren_binding.dart';
import 'package:beacon/Bindings/login_binding.dart';
import 'package:beacon/Bindings/my_vouchers_binding.dart';
import 'package:beacon/Bindings/offre_binding.dart';
import 'package:beacon/Bindings/otp_binding.dart';
import 'package:beacon/Bindings/signup_binding.dart';
import 'package:beacon/Bindings/splash_binding.dart';
import 'package:beacon/Bindings/user_binding.dart';
import 'package:beacon/Screens/information_screen.dart';
import 'package:beacon/Screens/login_screen.dart';
import 'package:beacon/Screens/permission_needed_screen.dart';
import 'package:beacon/Screens/point_redeem_verification_code_screen.dart';
import 'package:beacon/Screens/points_screen.dart';
import 'package:beacon/Screens/splash_screen.dart';
import 'package:beacon/Screens/voucher_details_screen.dart';
import 'package:beacon/Screens/signup_screen.dart';
import 'package:beacon/Screens/home_screen.dart';
import 'package:beacon/Screens/my_vouchers_screen.dart';
import 'package:beacon/Screens/founded_offers_screen.dart';
import 'package:beacon/Screens/profile_screen.dart';
import 'package:beacon/Screens/setting_screen.dart';
import 'package:beacon/Screens/verification_code_screen.dart';
import 'package:beacon/Screens/voucher_code_screen.dart';
import 'package:get/get.dart';

class Routes {
  static String initialRoute = splashScreen;

  static String splashScreen = '/splash';
  static String infoScreen = '/info';
  static String signUpScreen = '/signup';
  static String homeScreen = '/home';
  static String loginScreen = '/login';
  static String offersScreen = '/offers';
  static String vouchersScreen = '/vouchers';
  static String settingScreen = '/setting';
  static String profileScreen = '/profile';
  static String voucherDetailsScreen = '/useVoucher';
  static String voucherCodecreen = '/code';
  static String refCodescreen = '/refcode';
  static String bluetoothScreen = '/bluetooth';
  static String pointScreen = '/point';
  static String pointRedeemScreen = '/pointredeem';

  static final routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: infoScreen,
      page: () => const InformationsScreen(),
      binding: InfoScreenBinding(),
    ),
    GetPage(
      name: signUpScreen,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      binding: AnnonceBinding(),
    ),
    GetPage(
      name: offersScreen,
      page: () => OffersFoundScreen(),
      binding: OffreBinding(),
    ),
    GetPage(
      name: vouchersScreen,
      page: () => const VouchersScreen(),
      binding: MyVoucherBinding(),
    ),
    GetPage(
      name: settingScreen,
      page: () => const SettingScreen(),
    ),
    GetPage(
      name: bluetoothScreen,
      page: () => const NeedPermissionScreen(),
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
      binding: UserBinding(),
    ),
    GetPage(
      name: voucherDetailsScreen,
      page: () => VoucherDetailsScreen(),
    ),
    GetPage(
      name: voucherCodecreen,
      page: () => VerificationCodeScreen(),
    ),
    GetPage(
      name: refCodescreen,
      page: () => VoucherCodeScreen(),
    ),
    GetPage(
      name: pointScreen,
      page: () => PointsScreen(),
      binding: MyVoucherBinding(),
    ),
    GetPage(
      name: pointRedeemScreen,
      page: () => PointRedeemVerificationCodeScreen(),
      binding: OtpBinding(),
    ),
  ];
}
