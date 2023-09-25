import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'ProfileController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                10.heightBox,
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 48),
                  child: CustomeTextStyle(
                    text: "Good afternoon, Mai",
                    size: 22,
                    fontWeight: FontWeight.w600,
                    color: CustomAppColors.lblDarkColor,
                    wordSpacing: 4,
                  ),
                ),
                20.heightBox,
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    print('My Cart Click');
                    Get.toNamed(Routes.PROFILECARTROUTES);
                  },
                  child: Card(
                    color: CustomAppColors.cardBGColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 56,
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppImages.ProfileCart,
                                    height: 24,
                                    width: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          10.widthBox,
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: 56,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                child: CustomeTextStyle(
                                  text: "My cart",
                                  size: 16,
                                  fontWeight: FontWeight.w400,
                                  color: CustomAppColors.lblDarkColor,
                                  wordSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          10.widthBox,
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 56,
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.lblOrgColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        text: "5",
                                        size: 10,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColors.appWhiteColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                  // Image.asset(
                                  //   AppImages.ProfileCart,
                                  //   height: 24,
                                  //   width: 24,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                8.heightBox,
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    print('My Favorite');
                    Get.toNamed(Routes.PROFILEFAVORITEROUTES);
                  },
                  child: Card(
                    color: CustomAppColors.cardBGColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 56,
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppImages.ProfileHeart,
                                    height: 24,
                                    width: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          10.widthBox,
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: 56,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                child: CustomeTextStyle(
                                  text: "My favorite",
                                  size: 16,
                                  fontWeight: FontWeight.w400,
                                  color: CustomAppColors.lblDarkColor,
                                  wordSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          10.widthBox,
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 56,
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.lblOrgColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        text: "5",
                                        size: 10,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColors.appWhiteColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                  // Image.asset(
                                  //   AppImages.ProfileCart,
                                  //   height: 24,
                                  //   width: 24,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                16.heightBox,
                Container(
                  height: 1,
                  // color: CustomAppColors.lblDarkColor,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(child: Container()),
                      const MySeparator(
                        color: CustomAppColors.borderColor,
                      ),
                    ],
                  ),
                ),
                16.heightBox,
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    print('Email Password');
                  },
                  child: Card(
                    color: CustomAppColors.cardBGColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 56,
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppImages.ProfileBox,
                                    height: 24,
                                    width: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          10.widthBox,
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: 56,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                child: CustomeTextStyle(
                                  text: "My orders",
                                  size: 16,
                                  fontWeight: FontWeight.w400,
                                  color: CustomAppColors.lblDarkColor,
                                  wordSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          10.widthBox,
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 56,
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.lblOrgColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        text: "4",
                                        size: 10,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColors.appWhiteColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                  // Image.asset(
                                  //   AppImages.ProfileCart,
                                  //   height: 24,
                                  //   width: 24,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                16.heightBox,
                Container(
                  height: 1,
                  // color: CustomAppColors.lblDarkColor,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(child: Container()),
                      const MySeparator(
                        color: CustomAppColors.borderColor,
                      ),
                    ],
                  ),
                ),
                16.heightBox,
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    print('Phone Password');
                  },
                  child: Card(
                    color: CustomAppColors.cardBGColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      child: Row(
                        children: [
                          Container(
                            height: 56,
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.ProfileLocation,
                                  height: 24,
                                  width: 24,
                                ),
                              ],
                            ),
                          ),
                          10.widthBox,
                          Container(
                            height: 56,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: CustomeTextStyle(
                                text: "Addresses",
                                size: 16,
                                fontWeight: FontWeight.w400,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                8.heightBox,
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    print('Email Password');
                  },
                  child: Card(
                    color: CustomAppColors.cardBGColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      child: Row(
                        children: [
                          Container(
                            height: 56,
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.ProfilePayment,
                                  height: 24,
                                  width: 24,
                                ),
                              ],
                            ),
                          ),
                          10.widthBox,
                          Container(
                            height: 56,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: CustomeTextStyle(
                                text: "Payment info",
                                size: 16,
                                fontWeight: FontWeight.w400,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                16.heightBox,
                Container(
                  height: 1,
                  // color: CustomAppColors.lblDarkColor,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(child: Container()),
                      const MySeparator(
                        color: CustomAppColors.borderColor,
                      ),
                    ],
                  ),
                ),
                16.heightBox,
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    print('Context Us');
                    // controller.ContactUsScreen();
                    Get.toNamed(Routes.CONTACTUSROUTES);
                  },
                  child: Card(
                    color: CustomAppColors.cardBGColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      child: Row(
                        children: [
                          Container(
                            height: 56,
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.ProfileCallHelp,
                                  height: 24,
                                  width: 24,
                                ),
                              ],
                            ),
                          ),
                          10.widthBox,
                          Container(
                            height: 56,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: CustomeTextStyle(
                                text: "Contact us",
                                size: 16,
                                fontWeight: FontWeight.w400,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                8.heightBox,
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    print('Setting');
                    // controller.ProfileSettingScreen();
                    Get.toNamed(Routes.PROFILESETTINGROUTES);
                  },
                  child: Card(
                    color: CustomAppColors.cardBGColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      child: Row(
                        children: [
                          Container(
                            height: 56,
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.ProfileSetting,
                                  height: 24,
                                  width: 24,
                                ),
                              ],
                            ),
                          ),
                          10.widthBox,
                          Container(
                            height: 56,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: CustomeTextStyle(
                                text: "Setting",
                                size: 16,
                                fontWeight: FontWeight.w400,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                32.heightBox,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 56,
                  child: RoundedButton(
                    btnName: 'Logout',
                    btnBGColor: Colors.transparent,
                    btnStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: CustomAppColors.appWhiteColor,
                      wordSpacing: 1,
                      height: 1.2,
                    ),
                    callback: () async {
                      print('Click To LogOut');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
