import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../../ExtraClass/Routes/AppPages.dart';
import 'CheckoutController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:badges/src/badge.dart' as badge;

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var screenSize = MediaQuery.of(context).size;

    var arrCheckoutList = [
      {
        'cartID': '1',
      },
      {
        'cartID': '2',
      },
      {
        'cartID': '3',
      },
    ];
    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomeTextStyle(
          text: "Checkout",
          size: 22,
          fontWeight: FontWeight.w600,
          color: CustomAppColors.lblDarkColor,
          wordSpacing: 0.5,
        ),
        leading: GestureDetector(
          onTap: () {
            print('Click Back Button');
            // Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Image.asset(AppImages.appLogo),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              AppImages.ProfileCloseIcon,
              fit: BoxFit.contain,
              height: 28,
              width: 28,
            ),
            // Icon(Icons.person),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                height: 66,
                width: (screenSize.width - 48),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: arrCheckoutList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          print('Click to Categories Detail');
                        },
                        child: Container(
                          height: 66,
                          width: 56,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 66,
                                width: 56,
                                decoration: const BoxDecoration(
                                  color: CustomAppColors.switchOrgColor,
                                  image: DecorationImage(
                                    image: AssetImage(AppImages.HomeBestSale),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16);
                    }),
              ),
            ),
            32.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
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
            ),
            32.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                width: (screenSize.width - 48),
                height:
                    controller.isBillingAddressAdd.value == false ? 96 : 154,
                // color: Colors.deepPurple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      width: (screenSize.width - 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35,
                            width: controller.isBillingAddressAdd.value == false
                                ? 24
                                : (screenSize.width -
                                    280), //(screenSize.width - 218),
                            // color: Colors.red,
                            child: controller.isBillingAddressAdd.value == false
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Image.asset(
                                      AppImages.ProfileLocation,
                                      height: 35,
                                      width: 30,
                                    ),
                                  )
                                : CustomeTextStyle(
                                    text: "Guy Hawkins",
                                    size: 16,
                                    fontWeight: FontWeight.w600,
                                    color: CustomAppColors.lblDarkColor,
                                    wordSpacing: 4,
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              height:
                                  controller.isBillingAddressAdd.value == false
                                      ? 0
                                      : 12,
                              width:
                                  controller.isBillingAddressAdd.value == false
                                      ? 0
                                      : 1,
                              color:
                                  controller.isBillingAddressAdd.value == false
                                      ? Colors.transparent
                                      : CustomAppColors.txtPlaceholderColor,
                            ),
                          ),
                          Container(
                            height: 35,
                            width: controller.isBillingAddressAdd.value == false
                                ? (screenSize.width - 80)
                                : (screenSize.width -
                                    170), //(screenSize.width - 220),
                            // color: Colors.tealAccent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      controller.isBillingAddressAdd.value ==
                                              false
                                          ? const EdgeInsets.only(top: 8)
                                          : const EdgeInsets.only(top: 2),
                                  child: controller.isBillingAddressAdd.value ==
                                          false
                                      ? CustomeTextStyle(
                                          text: "Billing Address",
                                          size: 16,
                                          fontWeight: FontWeight.w600,
                                          color: CustomAppColors.lblDarkColor,
                                          wordSpacing: 4,
                                        )
                                      : CustomeTextStyle(
                                          text: "(+91) 98659 89898",
                                          size: 16,
                                          fontWeight: FontWeight.w600,
                                          color: CustomAppColors.lblDarkColor,
                                          wordSpacing: 4,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: controller.isBillingAddressAdd.value == false
                          ? 30
                          : 38,
                      width: (screenSize.width - 48),
                      // color: Colors.red,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height:
                                controller.isBillingAddressAdd.value == false
                                    ? 30
                                    : 38,
                            width: controller.isBillingAddressAdd.value == false
                                ? (screenSize.width - 118)
                                : (screenSize.width - 48),
                            // color: Colors.blue,
                            child: controller.isBillingAddressAdd.value == false
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Container(
                                      child: CustomeTextStyle(
                                        text: "Add billing address",
                                        size: 15,
                                        fontWeight: FontWeight.w400,
                                        color: CustomAppColors.lblColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  )
                                : Container(
                                    // color: Colors.teal,
                                    child: Container(
                                      child: CustomeTextStyle(
                                        text:
                                            "61 Dien Bien Phu Ward 15, HCMC, Vietnam",
                                        size: 15,
                                        fontWeight: FontWeight.w400,
                                        color: CustomAppColors.lblColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  ),
                          ),
                          controller.isBillingAddressAdd.value == false
                              ? InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    print('Click Add Billing Address');
                                  },
                                  child: Container(
                                    width:
                                        controller.isBillingAddressAdd.value ==
                                                false
                                            ? 60
                                            : 82,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: CustomAppColors.borderColor,
                                      ),
                                      color: CustomAppColors.cardBGColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        text: controller.isBillingAddressAdd
                                                    .value ==
                                                false
                                            ? "Add"
                                            : "Change",
                                        size: 14,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColors.lblOrgColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  color: Colors.red,
                                ),
                        ],
                      ),
                    ),
                    controller.isBillingAddressAdd.value == false
                        ? 0.heightBox
                        : 20.heightBox,
                    controller.isBillingAddressAdd.value == false
                        ? Container()
                        : Container(
                            // color: Colors.blue,
                            height: 30,
                            width: 254,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 82,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: CustomAppColors.cardBGColor,
                                    border: Border.all(
                                      width: 1,
                                      color: CustomAppColors.borderColor,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Center(
                                    child: CustomeTextStyle(
                                      text: "Change",
                                      size: 14,
                                      fontWeight: FontWeight.w600,
                                      color: CustomAppColors.lblOrgColor,
                                      wordSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                12.widthBox,
                                Container(
                                  width: 160,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: CustomAppColors.cardBGColor,
                                    border: Border.all(
                                      width: 1,
                                      color: CustomAppColors.borderColor,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Center(
                                    child: CustomeTextStyle(
                                      text: "Shipping addresses",
                                      size: 14,
                                      fontWeight: FontWeight.w600,
                                      color: CustomAppColors.lblOrgColor,
                                      wordSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    30.heightBox,
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
                  ],
                ),
              ),
            ),
            32.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                width: (screenSize.width - 48),
                height: 96,
                // color: Colors.deepPurple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      width: (screenSize.width - 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35,
                            width: 24,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Image.asset(
                                AppImages.ProfilePayment,
                                height: 35,
                                width: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 35,
                            width: (screenSize.width - 80),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: CustomeTextStyle(
                                    text: "Payment Method",
                                    size: 16,
                                    fontWeight: FontWeight.w600,
                                    color: CustomAppColors.lblDarkColor,
                                    wordSpacing: 4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      width: (screenSize.width - 48),
                      // color: Colors.red,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: controller.isPaymentMethodAdd.value == false
                                ? (screenSize.width - 118)
                                : (screenSize.width - 140),
                            // color: Colors.blue,
                            child: controller.isPaymentMethodAdd.value == false
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Container(
                                      child: CustomeTextStyle(
                                        text: "Add a payment method",
                                        size: 15,
                                        fontWeight: FontWeight.w400,
                                        color: CustomAppColors.lblColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          child: Image.asset(
                                            AppImages.ProfileCreditCardIcon,
                                            height: 35,
                                            width: 30,
                                          ),
                                        ),
                                        12.widthBox,
                                        Container(
                                          child: CustomeTextStyle(
                                            text: 'Mastercard - 9904',
                                            size: 15,
                                            fontWeight: FontWeight.w400,
                                            color: CustomAppColors.lblColor,
                                            wordSpacing: 4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              print('Click Add Billing Address');
                            },
                            child: Container(
                              width:
                                  controller.isPaymentMethodAdd.value == false
                                      ? 60
                                      : 82,
                              height: 30,
                              decoration: BoxDecoration(
                                color: CustomAppColors.cardBGColor,
                                border: Border.all(
                                  width: 1,
                                  color: CustomAppColors.borderColor,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Center(
                                child: CustomeTextStyle(
                                  text: controller.isPaymentMethodAdd.value ==
                                          false
                                      ? "Add"
                                      : "Change",
                                  size: 14,
                                  fontWeight: FontWeight.w600,
                                  color: CustomAppColors.lblOrgColor,
                                  wordSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.heightBox,
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
                  ],
                ),
              ),
            ),
            32.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                height: 132,
                width: (screenSize.width - 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 24,
                      width: (screenSize.width - 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            child: CustomeTextStyle(
                              text: "Subtotal",
                              size: 15,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblColor,
                              wordSpacing: 4,
                            ),
                          ),
                          Container(
                            width: 130,
                            child: CustomeTextStyle(
                              text: "Rs 150.86",
                              size: 15,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 4,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    12.heightBox,
                    Container(
                      height: 24,
                      width: (screenSize.width - 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            child: CustomeTextStyle(
                              text: "Discount",
                              size: 15,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblColor,
                              wordSpacing: 4,
                            ),
                          ),
                          Container(
                            width: 130,
                            child: CustomeTextStyle(
                              text: "Rs 00.00",
                              size: 15,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 4,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    12.heightBox,
                    Container(
                      height: 24,
                      width: (screenSize.width - 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            child: CustomeTextStyle(
                              text: "Delivery fee",
                              size: 15,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblColor,
                              wordSpacing: 4,
                            ),
                          ),
                          Container(
                            width: 130,
                            child: CustomeTextStyle(
                              text: "Rs 10.00",
                              size: 15,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 4,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    12.heightBox,
                    Container(
                      height: 24,
                      width: (screenSize.width - 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            child: CustomeTextStyle(
                              text: "Total",
                              size: 15,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblOrgColor,
                              wordSpacing: 4,
                            ),
                          ),
                          Container(
                            width: 130,
                            child: CustomeTextStyle(
                              text: "Rs 160.86",
                              size: 15,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblOrgColor,
                              wordSpacing: 4,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                height: 44,
                width: (screenSize.width - 48),
                decoration: BoxDecoration(
                  color: CustomAppColors.cardBGColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(22),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 130,
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        validator: (strCode) {
                          if (strCode == null || strCode.isEmpty) {
                            controller.strDiscount.value = 'No';
                            controller.isDiscountCodeAdd.value = false;
                            return null;
                          } else {
                            controller.strDiscount.value = strCode;
                            controller.isDiscountCodeAdd.value = true;
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: false,
                        controller: null,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: CustomAppColors.txtPlaceholderColor,
                        cursorWidth: 2,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: CustomAppColors.txtPlaceholderColor,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 4,
                              left: 10,
                              bottom: 0), // add padding to adjust text
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter discount code',
                          hintStyle: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: CustomAppColors.txtPlaceholderColor,
                            wordSpacing: 1,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        print('Click Add Billing Address');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 60,
                          height: 32,
                          decoration: BoxDecoration(
                            color: CustomAppColors.lblDarkColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: CustomeTextStyle(
                              text: "Add",
                              size: 14,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.appWhiteColor,
                              wordSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            32.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 48,
                height: 56,
                child: RoundedButton(
                  btnName: 'Place order',
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
                    print('Click Place order');
                    Get.toNamed(Routes.PROFILEBUYSTATUSROUTES);
                  },
                ),
              ),
            ),
            32.heightBox,
          ],
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
