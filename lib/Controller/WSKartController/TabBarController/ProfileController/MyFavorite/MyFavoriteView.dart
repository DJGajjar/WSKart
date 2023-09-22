import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../ExtraClass/Routes/AppPages.dart';
import 'MyFavoriteController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';

class MyFavoriteView extends GetView<MyFavoriteController> {
  const MyFavoriteView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomeTextStyle(
          text: "My Favorite",
          size: 16,
          fontWeight: FontWeight.w600,
          color: CustomAppColors.lblDarkColor,
          wordSpacing: 0.5,
        ),
        leading: GestureDetector(
          onTap: () {
            print('Click Back Button');
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Image.asset(AppImages.BackIcon),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              AppImages.ProfileAvtar,
              fit: BoxFit.contain,
              height: 38,
              width: 38,
            ),
            // Icon(Icons.person),
            onPressed: () {
              print('Profile Click');
              Get.toNamed(Routes.MYPROFILEROUTES);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                10.heightBox,
                Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width - 48,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.ProfileHeart),
                            ),
                          ),
                        ),
                        8.widthBox,
                        Container(
                          height: 40,
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: CustomeTextStyle(
                              text: "My Favorite",
                              size: 22,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    )),
                16.heightBox,
                Container(
                  height: 1,
                  width: (MediaQuery.of(context).size.width - 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 1,
                          color: CustomAppColors.lblOrgColor,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 1,
                          color: CustomAppColors.switchOrgColor,
                        ),
                      ),
                    ],
                  ),
                ),
                30.heightBox,
                Card(
                  color: CustomAppColors.cardBGColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Container(
                    width: 156,
                    height: 256,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 154,
                          width: 156,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.ProfileMyFavorite),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: 156,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0, left: 6),
                                      child: Container(
                                        width: 36,
                                        height: 16,
                                        // color: CustomAppColors.lblOrgColor,
                                        decoration: BoxDecoration(
                                          color: CustomAppColors.lblOrgColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: Center(
                                          child: CustomeTextStyle(
                                            text: "63%",
                                            size: 10,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                CustomAppColors.appWhiteColor,
                                            wordSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: Container(
                                        width: 28,
                                        height: 28,
                                        decoration: const BoxDecoration(
                                          color: CustomAppColors.appWhiteColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(28)),
                                        ),
                                        child: Center(
                                          child: Container(
                                            width: 16,
                                            height: 16,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(AppImages
                                                    .ProfileFavoriteIcon),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(9, 4, 9, 2),
                          child: Container(
                            child: CustomeTextStyle(
                              text: "Sofa Furniture Leg 3",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 0.5,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(9, 9, 9, 2),
                          child: Container(
                            width: 120,
                            height: 10,
                            child: CustomeTextStyle(
                              text: "In Stock",
                              size: 7,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 0.5,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(9, 4, 9, 2),
                          child: Container(
                            width: 120,
                            height: 10,
                            child: CustomeTextStyle(
                              text: "₹1000 ₹599",
                              size: 10,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                32.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
