import 'package:get/get.dart';
import 'package:wskart/Controller/SplashController/SplashBinding.dart';
import 'package:wskart/Controller/SplashController/SplashView.dart';
import 'package:wskart/Controller/OfferController/OfferBinding.dart';
import 'package:wskart/Controller/OfferController/OfferView.dart';
import 'package:wskart/Controller/StartedController/StartBinding.dart';
import 'package:wskart/Controller/StartedController/StartView.dart';
import 'package:wskart/Controller/WelcomeController/WelcomeBinding.dart';
import 'package:wskart/Controller/WelcomeController/WelcomeView.dart';
import 'package:wskart/Controller/LoginController/LoginView.dart';
import 'package:wskart/Controller/LoginController/LoginBinding.dart';

part 'AppRoutes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.OFFERBANNER,
      page: () => const OfferView(),
      binding: OfferBinding(),
    ),
    GetPage(
      name: _Paths.WELCOMEBANNER,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.GETSTART,
      page: () => const StartView(),
      binding: StartBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
