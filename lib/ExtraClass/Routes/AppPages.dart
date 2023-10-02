import 'package:get/get.dart';
import 'package:wskart/Controller/SplashController/SplashBinding.dart';
import 'package:wskart/Controller/SplashController/SplashView.dart';
import 'package:wskart/Controller/OfferController/OfferBinding.dart';
import 'package:wskart/Controller/OfferController/OfferView.dart';
import 'package:wskart/Controller/StartedController/StartBinding.dart';
import 'package:wskart/Controller/StartedController/StartView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyOrder/MyOrderView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyOrder/ReviewOrder/ReviewOrderBinding.dart';
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
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyFavorite/MyFavoriteBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyFavorite/MyFavoriteView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyProfile/MyProfileBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyProfile/MyProfileView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/MyCartBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/MyCartView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/Checkout/CheckoutBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/Checkout/CheckoutView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/BuyingStatus/BuyingStatusView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/BuyingStatus/BuyingStatusBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/BillingAddress/BillingAddressBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/BillingAddress/BillingAddressView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/CreditCart/CreditCartBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/CreditCart/CreditCartView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/ShippingAddress/ShippingAddressView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/ShippingAddress/ShippingAddressBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/PaymentMethod/PaymentMethodBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/PaymentMethod/PaymentMethodView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyOrder/MyOrderBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyOrder/OrderDetail/OrderDetailView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyOrder/OrderDetail/OrderDetailBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyOrder/CancelOrder/CancelOrderView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyOrder/CancelOrder/CancelOrderBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyOrder/ReturnOrder/ReturnOrderView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyOrder/ReturnOrder/ReturnOrderBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyOrder/ReviewOrder/ReviewOrderView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyFavorite/ProductDetail/ProductDetailView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyFavorite/ProductDetail/ProductDetailBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/SearchController/FilterProduct/FilterView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/SearchController/FilterProduct/FilterBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/SearchController/SearchResult/SearchResultBinding.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/SearchController/SearchResult/SearchResultView.dart';

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
    GetPage(
      name: _Paths.PROFILECART,
      page: () => const MyCartView(),
      binding: MyCartBinding(),
    ),
    GetPage(
      name: _Paths.PROFILECHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEBUYSTATUS,
      page: () => const BuyingStatusView(),
      binding: BuyingStatusBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEBILLINGADDRESS,
      page: () => const BillingAddressView(),
      binding: BillingAddressBinding(),
    ),
    GetPage(
      name: _Paths.PROFILENEWCREDITCART,
      page: () => const CreditCartView(),
      binding: CreditCartBinding(),
    ),
    GetPage(
      name: _Paths.PROFILESHIPPINGADDRESS,
      page: () => const ShippingAddressView(),
      binding: ShippingAddressBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEPAYMENTLIST,
      page: () => const PaymentMethodView(),
      binding: PaymentMethodBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEMYORDERLIST,
      page: () => const MyOrderView(),
      binding: MyOrderBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEORDERDETAIL,
      page: () => const OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEORDERDCANCEL,
      page: () => const CancelOrderView(),
      binding: CancelOrderBinding(),
    ),
    GetPage(
      name: _Paths.PROFILERETURNORDER,
      page: () => const ReturnOrderView(),
      binding: ReturnOrderBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEREVIEW,
      page: () => const ReviewOrderView(),
      binding: ReviewOrderBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEPRODUCTDETAIL,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTFILTER,
      page: () => const FilterView(),
      binding: FilterBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHRESULT,
      page: () => const SearchResultView(),
      binding: SearchResultBinding(),
    ),
  ];
}
