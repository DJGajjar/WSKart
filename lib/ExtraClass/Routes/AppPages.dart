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
import 'package:wskart/Controller/VerifyNumberController/VerifyBinding.dart';
import 'package:wskart/Controller/VerifyNumberController/VerifyView.dart';
import 'package:wskart/Controller/SignUpController/SignUpBinding.dart';
import 'package:wskart/Controller/SignUpController/SignUpView.dart';
import 'package:wskart/Controller/ResetPaswwordController/ResetPasswordOption/PasswordOptionBinding.dart';
import 'package:wskart/Controller/ResetPaswwordController/ResetPasswordOption/PasswordOptionView.dart';
import 'package:wskart/Controller/ResetPaswwordController/ResetPasswordPhone/PhoneBinding.dart';
import 'package:wskart/Controller/ResetPaswwordController/ResetPasswordPhone/PhoneView.dart';
import 'package:wskart/Controller/ResetPaswwordController/ResetPasswordPhone/VerificationOTP/VerificationOTPBinding.dart';
import 'package:wskart/Controller/ResetPaswwordController/ResetPasswordPhone/VerificationOTP/VerificationOTPView.dart';
import 'package:wskart/Controller/ResetPaswwordController/SetNewPassword/NewPasswordBindiing.dart';
import 'package:wskart/Controller/ResetPaswwordController/SetNewPassword/NewPasswordView.dart';

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
    GetPage(
      name: _Paths.VERIFYNUMBER,
      page: () => const VerifyView(),
      binding: VerifyBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORDOPTION,
      page: () => const PasswordOptionView(),
      binding: PasswordOptionBinding(),
    ),
    GetPage(
      name: _Paths.RESETPHONEPASSWORD,
      page: () => const PhoneView(),
      binding: PhoneBinding(),
    ),
    GetPage(
      name: _Paths.RESETPHONEOTP,
      page: () => const VerificationOTPView(),
      binding: VerificationOTPBinding(),
    ),
    GetPage(
      name: _Paths.NEWPASSWORDSET,
      page: () => const NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
  ];
}
