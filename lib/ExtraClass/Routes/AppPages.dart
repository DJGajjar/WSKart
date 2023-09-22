import 'package:get/get.dart';
import 'package:wskart/Controller/SplashController/SplashBinding.dart';
import 'package:wskart/Controller/SplashController/SplashView.dart';
import 'package:wskart/Controller/OfferController/OfferBinding.dart';
import 'package:wskart/Controller/OfferController/OfferView.dart';
import 'package:wskart/Controller/StartedController/StartBinding.dart';
import 'package:wskart/Controller/StartedController/StartView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyFavorite/MyFavoriteBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyFavorite/MyFavoriteView.dart';
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
import 'package:wskart/Controller/TermsAndServiceController/TermServiceBinding.dart';
import 'package:wskart/Controller/TermsAndServiceController/TermServiceView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/HomeController/HomeBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/HomeController/HomeView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/SearchController/SearchBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/SearchController/SearchView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/NotificationController/NotificationBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/NotificationController/NotificationView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/ProfileBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/ProfileView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/TabBarBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/TabBarView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyProfile/MyProfileBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyProfile/MyProfileView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/ContactUs/ContactUsBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/ContactUs/ContactUsView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/ProfileSearch/ProfileSearchBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/ProfileSearch/ProfileSearchView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyProfile/MyProfileBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyProfile/MyProfileView.dart';

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
      name: _Paths.SIGNUP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.TERMSSERVICE,
      page: () => const TermServiceView(),
      binding: TermServicenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
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
      name: _Paths.VERIFYNUMBER,
      page: () => const VerifyView(),
      binding: VerifyBinding(),
    ),
    GetPage(
      name: _Paths.TABBAR,
      page: () => const TabBarView(),
      binding: TabBarBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MYPROFILE,
      page: () => const MyProfileView(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: _Paths.CONTACTUS,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILESETTING,
      page: () => const ProfileSearchView(),
      binding: ProfileSearchBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEFAVORITE,
      page: () => const MyFavoriteView(),
      binding: MyFavoriteBinding(),
    ),
  ];
}
