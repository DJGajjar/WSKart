import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
    /*return GetMaterialApp(
      getPages: [
        GetPage(
          participatesInRootNavigator: true,
          name: '/',
          page: () => SplashView(),
        ),
        GetPage(
          name: '/OfferBanner',
          page: () => OfferBannerView(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: '/WelcomeBanner',
          page: () => WelcomeBannerView(),
          transition: Transition.rightToLeftWithFade,
        ),
      ],
      debugShowCheckedModeBanner: false,
    );*/
    // return MaterialApp(
    //   title: 'WSKart',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    //     useMaterial3: true,
    //   ),
    //   home: SplashView(),
    // );
  }
}

/*
class SplashViewController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offAllNamed('/OfferBanner');
    });
  }

  @override
  void onClose() {
    print('On Close SplashScreen');
    super.onClose();
  }
}

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SplashView Rebuild');
    Get.put(SplashViewController());

    return Scaffold(
      body: Container(
        color: CustomAppColors.appBGColor,
        child: Center(
          child: Container(
            width: 142,
            height: 108,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.appLogo),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void WelcomeBannerViewController() {
  //   Timer(Duration(seconds: 2), () {});
  // }
}

class OfferViewController extends GetxController {
  @override
  void onClose() {
    print('On Close Offer');
    super.onClose();
  }
}

class OfferBannerView extends StatelessWidget {
  const OfferBannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OfferViewController());
    print('Offer rebuild');
    return Scaffold(
      body: Container(
        // width: double.infinity,
        // height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.offerBanner),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class WelcomeViewController extends GetxController {
  @override
  void onClose() {
    print('On Close Welcome');
    super.onClose();
  }
}

class WelcomeBannerView extends StatelessWidget {
  const WelcomeBannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomeViewController());
    print('Welcome Rebuild');
    return Scaffold(
      body: Container(
        // width: double.infinity,
        // height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.welcomeBanner),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

*/

// https://www.youtube.com/watch?v=5ARwxw6-GwQ
//https://www.youtube.com/watch?v=M0OwOYPFkrM
//https://blog.logrocket.com/build-an-intuitive-ecommerce-product-gallery-with-flutter/
//https://blog.logrocket.com/building-shopping-cart-flutter/
