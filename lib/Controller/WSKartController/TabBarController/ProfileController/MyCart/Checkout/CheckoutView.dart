import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../../Constants/ServiceList.dart';
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
import 'package:cc_avenue/cc_avenue.dart';

enum SingingCharacter { lafayette, jefferson }

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView>
    with TickerProviderStateMixin {
  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  ScrollController scrollController = ScrollController();

  bool isPageEnd = false;

  bool isSelectCCAvenue = false;
  bool isSelectCOD = false;

  CheckoutController checkOutController = Get.put(CheckoutController());

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showNewVersionAvailableDialog(BuildContext context) {
    final alert = AlertDialog(
      title: Text("Error"),
      content: Text("There was an error during login."),
      actions: [TextButton(child: Text("OK"), onPressed: () {})],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var screenSize = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    SingingCharacter? _character = SingingCharacter.lafayette;

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

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
        child: Form(
          key: formGlobalKey,
          child: Obx(
            () => (Get.find<CheckoutController>().isCheckOut.value &&
                    Get.find<CheckoutController>().cartItemCount.value == 0)
                ? Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: CustomAppColors.lblOrgColor,
                        backgroundColor: CustomAppColors.switchOrgColor,
                      ),
                    ),
                  )
                : Column(
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
                              itemCount: checkOutController.cartItemCount.value,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 56,
                                            height: 66,
                                            decoration: BoxDecoration(
                                              color: CustomAppColors
                                                  .switchOrgColor,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  '${checkOutController.addToCartList.cartItems?[index]?.product_image == '' ? AppService.noImageUrl : checkOutController.addToCartList.cartItems?[index]?.product_image}',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              border: Border.all(
                                                width: 1,
                                                color: CustomAppColors
                                                    .switchOrgColor,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            )),
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
                              checkOutController.isBillingAddressAdd.value ==
                                      false
                                  ? 96
                                  : 154,
                          // color: Colors.deepPurple,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 35,
                                width: (screenSize.width - 48),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: checkOutController
                                                  .isBillingAddressAdd.value ==
                                              false
                                          ? 24
                                          : (screenSize.width -
                                              280), //(screenSize.width - 218),
                                      // color: Colors.red,
                                      child: checkOutController
                                                  .isBillingAddressAdd.value ==
                                              false
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 2),
                                              child: Image.asset(
                                                AppImages.ProfileLocation,
                                                height: 35,
                                                width: 30,
                                              ),
                                            )
                                          : CustomeTextStyle(
                                              text:
                                                  '${checkOutController.addToCartList.userData?.shippingData?.first_name} ${checkOutController.addToCartList.userData?.shippingData?.last_name}',
                                              size: 16,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  CustomAppColors.lblDarkColor,
                                              wordSpacing: 4,
                                            ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                        height: checkOutController
                                                    .isBillingAddressAdd
                                                    .value ==
                                                false
                                            ? 0
                                            : 12,
                                        width: checkOutController
                                                    .isBillingAddressAdd
                                                    .value ==
                                                false
                                            ? 0
                                            : 1,
                                        color: checkOutController
                                                    .isBillingAddressAdd
                                                    .value ==
                                                false
                                            ? Colors.transparent
                                            : CustomAppColors
                                                .txtPlaceholderColor,
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: checkOutController
                                                  .isBillingAddressAdd.value ==
                                              false
                                          ? (screenSize.width - 80)
                                          : (screenSize.width -
                                              170), //(screenSize.width - 220),
                                      // color: Colors.tealAccent,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: checkOutController
                                                        .isBillingAddressAdd
                                                        .value ==
                                                    false
                                                ? const EdgeInsets.only(top: 8)
                                                : const EdgeInsets.only(top: 2),
                                            child: checkOutController
                                                        .isBillingAddressAdd
                                                        .value ==
                                                    false
                                                ? CustomeTextStyle(
                                                    text: "Billing Address",
                                                    size: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: CustomAppColors
                                                        .lblDarkColor,
                                                    wordSpacing: 4,
                                                  )
                                                : CustomeTextStyle(
                                                    text: checkOutController
                                                                .addToCartList
                                                                .userData
                                                                ?.shippingData
                                                                ?.phone ==
                                                            ""
                                                        ? "-"
                                                        : '${checkOutController.addToCartList.userData?.shippingData?.phone}',
                                                    size: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: CustomAppColors
                                                        .lblDarkColor,
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
                                height: checkOutController
                                            .isBillingAddressAdd.value ==
                                        false
                                    ? 30
                                    : 38,
                                width: (screenSize.width - 48),
                                // color: Colors.red,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: checkOutController
                                                  .isBillingAddressAdd.value ==
                                              false
                                          ? 30
                                          : 38,
                                      width: checkOutController
                                                  .isBillingAddressAdd.value ==
                                              false
                                          ? (screenSize.width - 118)
                                          : (screenSize.width - 48),
                                      // color: Colors.blue,
                                      child: checkOutController
                                                  .isBillingAddressAdd.value ==
                                              false
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text: "Add billing address",
                                                  size: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      CustomAppColors.lblColor,
                                                  wordSpacing: 4,
                                                ),
                                              ),
                                            )
                                          : Container(
                                              // color: Colors.teal,
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text: checkOutController
                                                      .strAddress,
                                                  size: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      CustomAppColors.lblColor,
                                                  wordSpacing: 4,
                                                ),
                                              ),
                                            ),
                                    ),
                                    checkOutController
                                                .isBillingAddressAdd.value ==
                                            false
                                        ? InkWell(
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              print(
                                                  'Click Add Billing Address');
                                              Get.toNamed(Routes
                                                  .PROFILEBILLINGADDRESSROUTES);
                                            },
                                            child: Container(
                                              width: checkOutController
                                                          .isBillingAddressAdd
                                                          .value ==
                                                      false
                                                  ? 60
                                                  : 82,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: CustomAppColors
                                                      .borderColor,
                                                ),
                                                color:
                                                    CustomAppColors.cardBGColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                              child: Center(
                                                child: CustomeTextStyle(
                                                  text: checkOutController
                                                              .isBillingAddressAdd
                                                              .value ==
                                                          false
                                                      ? "Add"
                                                      : "Change",
                                                  size: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: CustomAppColors
                                                      .lblOrgColor,
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
                              checkOutController.isBillingAddressAdd.value ==
                                      false
                                  ? 0.heightBox
                                  : 20.heightBox,
                              checkOutController.isBillingAddressAdd.value ==
                                      false
                                  ? Container()
                                  : Container(
                                      // color: Colors.blue,
                                      height: 30,
                                      width: 254,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              print('Change Address');
                                              Get.toNamed(Routes
                                                  .PROFILESHIPPINGADDRESSROUTES);
                                            },
                                            child: Container(
                                              width: 82,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color:
                                                    CustomAppColors.cardBGColor,
                                                border: Border.all(
                                                  width: 1,
                                                  color: CustomAppColors
                                                      .borderColor,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                              child: Center(
                                                child: CustomeTextStyle(
                                                  text: "Change",
                                                  size: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: CustomAppColors
                                                      .lblOrgColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                          12.widthBox,
                                          InkWell(
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              print('Shipping address');
                                              Get.toNamed(Routes
                                                  .PROFILESHIPPINGADDRESSROUTES);
                                            },
                                            child: Container(
                                              width: 160,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color:
                                                    CustomAppColors.cardBGColor,
                                                border: Border.all(
                                                  width: 1,
                                                  color: CustomAppColors
                                                      .borderColor,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                              child: Center(
                                                child: CustomeTextStyle(
                                                  text: "Shipping addresses",
                                                  size: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: CustomAppColors
                                                      .lblOrgColor,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: CustomeTextStyle(
                                              text: "Payment Method",
                                              size: 16,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  CustomAppColors.lblDarkColor,
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
                                      width: (screenSize.width - 48),
                                      // color: Colors.blue,
                                      child: checkOutController
                                                  .isPaymentMethodAdd.value ==
                                              false
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text: "Add a payment method",
                                                  size: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      CustomAppColors.lblColor,
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
                                                    height: 35,
                                                    width: 30,
                                                    child: IconButton(
                                                      icon: Image.asset(
                                                        isSelectCCAvenue
                                                            ? AppImages
                                                                .ProfileCheckOrderIcon
                                                            : AppImages
                                                                .ProfileUnCheckOrderIcon,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      tooltip: 'Set sound',
                                                      onPressed: () {
                                                        isSelectCCAvenue = true;
                                                        isSelectCOD = false;
                                                        setState(() {
                                                          print(
                                                              'Select CCAVENUE');
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  5.widthBox,
                                                  Container(
                                                    width: 120,
                                                    child: CustomeTextStyle(
                                                      text: "CCAvenue",
                                                      size: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: CustomAppColors
                                                          .lblColor,
                                                      wordSpacing: 4,
                                                    ),
                                                  ),
                                                  5.widthBox,
                                                  Container(
                                                    height: 35,
                                                    width: 30,
                                                    child: IconButton(
                                                      icon: Image.asset(
                                                        isSelectCOD
                                                            ? AppImages
                                                                .ProfileCheckOrderIcon
                                                            : AppImages
                                                                .ProfileUnCheckOrderIcon,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      tooltip: 'Set sound',
                                                      onPressed: () {
                                                        isSelectCCAvenue =
                                                            false;
                                                        isSelectCOD = true;
                                                        setState(() {
                                                          print("Select COD");
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  5.widthBox,
                                                  Container(
                                                    width: 120,
                                                    child: CustomeTextStyle(
                                                      text: "COD",
                                                      size: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: CustomAppColors
                                                          .lblColor,
                                                      wordSpacing: 4,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                    ),
                                    /*InkWell(
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        print('Click Add Payment Method');
                                        checkOutController
                                                    .isPaymentMethodAdd.value ==
                                                false
                                            ? Get.toNamed(Routes
                                                .PROFILENEWCREDITCARROUTES)
                                            : Get.toNamed(Routes
                                                .PROFILEPAYMENTLISTROUTES);
                                      },
                                      child: Container(
                                        width: checkOutController
                                                    .isPaymentMethodAdd.value ==
                                                false
                                            ? 60
                                            : 82,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: CustomAppColors.cardBGColor,
                                          border: Border.all(
                                            width: 1,
                                            color: CustomAppColors.borderColor,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: Center(
                                          child: CustomeTextStyle(
                                            text: checkOutController
                                                        .isPaymentMethodAdd
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
                                    ),*/
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        text: "Rs " +
                                            '${checkOutController.addToCartList.cartTotals?.subtotal}',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        text: "Rs " +
                                            '${checkOutController.addToCartList.cartTotals?.discount_total}',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        text: "Rs " +
                                            '${checkOutController.addToCartList.cartTotals?.shipping_total}',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        text: "Rs " +
                                            '${checkOutController.addToCartList.cartTotals?.total}',
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
                                      checkOutController.strDiscount.value =
                                          'No';
                                      checkOutController
                                          .isDiscountCodeAdd.value = false;
                                      return null;
                                    } else {
                                      checkOutController.strDiscount.value =
                                          strCode;
                                      checkOutController
                                          .isDiscountCodeAdd.value = true;
                                      return null;
                                    }
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  obscureText: false,
                                  controller: null,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor:
                                      CustomAppColors.txtPlaceholderColor,
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
                                        bottom:
                                            0), // add padding to adjust text
                                    isDense: true,
                                    border: InputBorder.none,
                                    hintText: 'Enter discount code',
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color:
                                          CustomAppColors.txtPlaceholderColor,
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
                                  print(
                                      'Click Add Discount Code: ${checkOutController.strDiscount.value}');
                                  checkOutController.applyCouponCode(
                                      checkOutController.strDiscount.value);

                                  if (checkOutController.isShowAlert.value ==
                                      true) {
                                    print("Show Alet Dialog Pop up");
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.lblDarkColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
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
                      checkOutController.strDiscountStatus.value != ''
                          ? 8.heightBox
                          : 0.heightBox,
                      checkOutController.strDiscountStatus.value != ''
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: Container(
                                width: (screenSize.width - 48),
                                child: CustomeTextStyle(
                                  text: checkOutController.strMsg.value,
                                  size: 15,
                                  fontWeight: FontWeight.w400,
                                  color: checkOutController
                                              .strDiscountStatus.value !=
                                          '2'
                                      ? Colors.red
                                      : CustomAppColors.badgeBGColor,
                                  wordSpacing: 4,
                                ),
                              ),
                            )
                          : Container(),
                      checkOutController.strDiscountStatus.value != ''
                          ? 32.heightBox
                          : 24.heightBox,
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
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Result'),
                                  content: Text('Result is'),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Get.toNamed(
                                              Routes.PROFILEBUYSTATUSROUTES);
                                        },
                                        child: Text('Go Back'))
                                  ],
                                ),
                              );
                            },
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

/*class CheckoutView extends GetView<CheckoutController> {
  CheckoutView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  CheckoutController checkOutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var screenSize = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    SingingCharacter? _character = SingingCharacter.lafayette;

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
        child: Form(
          key: formGlobalKey,
          child: Obx(
            () => Get.find<CheckoutController>().isCheckOut.value &&
                    Get.find<CheckoutController>().cartItemCount.value == 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: CustomAppColors.lblOrgColor,
                        backgroundColor: CustomAppColors.switchOrgColor,
                      ),
                    ),
                  )
                : Column(
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
                              itemCount: checkOutController.cartItemCount.value,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 56,
                                            height: 66,
                                            decoration: BoxDecoration(
                                              color: CustomAppColors
                                                  .switchOrgColor,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  '${checkOutController.addToCartList.cartItems?[index]?.product_image == '' ? AppService.noImageUrl : checkOutController.addToCartList.cartItems?[index]?.product_image}',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              border: Border.all(
                                                width: 1,
                                                color: CustomAppColors
                                                    .switchOrgColor,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            )),
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
                          height: controller.isBillingAddressAdd.value == false
                              ? 96
                              : 154,
                          // color: Colors.deepPurple,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 35,
                                width: (screenSize.width - 48),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: controller
                                                  .isBillingAddressAdd.value ==
                                              false
                                          ? 24
                                          : (screenSize.width -
                                              280), //(screenSize.width - 218),
                                      // color: Colors.red,
                                      child: controller
                                                  .isBillingAddressAdd.value ==
                                              false
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 2),
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
                                              color:
                                                  CustomAppColors.lblDarkColor,
                                              wordSpacing: 4,
                                            ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                        height: controller.isBillingAddressAdd
                                                    .value ==
                                                false
                                            ? 0
                                            : 12,
                                        width: controller.isBillingAddressAdd
                                                    .value ==
                                                false
                                            ? 0
                                            : 1,
                                        color: controller.isBillingAddressAdd
                                                    .value ==
                                                false
                                            ? Colors.transparent
                                            : CustomAppColors
                                                .txtPlaceholderColor,
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: controller
                                                  .isBillingAddressAdd.value ==
                                              false
                                          ? (screenSize.width - 80)
                                          : (screenSize.width -
                                              170), //(screenSize.width - 220),
                                      // color: Colors.tealAccent,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: controller
                                                        .isBillingAddressAdd
                                                        .value ==
                                                    false
                                                ? const EdgeInsets.only(top: 8)
                                                : const EdgeInsets.only(top: 2),
                                            child: controller
                                                        .isBillingAddressAdd
                                                        .value ==
                                                    false
                                                ? CustomeTextStyle(
                                                    text: "Billing Address",
                                                    size: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: CustomAppColors
                                                        .lblDarkColor,
                                                    wordSpacing: 4,
                                                  )
                                                : CustomeTextStyle(
                                                    text: "(+91) 98659 89898",
                                                    size: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: CustomAppColors
                                                        .lblDarkColor,
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
                                height: controller.isBillingAddressAdd.value ==
                                        false
                                    ? 30
                                    : 38,
                                width: (screenSize.width - 48),
                                // color: Colors.red,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: controller
                                                  .isBillingAddressAdd.value ==
                                              false
                                          ? 30
                                          : 38,
                                      width: controller
                                                  .isBillingAddressAdd.value ==
                                              false
                                          ? (screenSize.width - 118)
                                          : (screenSize.width - 48),
                                      // color: Colors.blue,
                                      child: controller
                                                  .isBillingAddressAdd.value ==
                                              false
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text: "Add billing address",
                                                  size: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      CustomAppColors.lblColor,
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
                                                  color:
                                                      CustomAppColors.lblColor,
                                                  wordSpacing: 4,
                                                ),
                                              ),
                                            ),
                                    ),
                                    controller.isBillingAddressAdd.value ==
                                            false
                                        ? InkWell(
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              print(
                                                  'Click Add Billing Address');
                                              Get.toNamed(Routes
                                                  .PROFILEBILLINGADDRESSROUTES);
                                            },
                                            child: Container(
                                              width: controller
                                                          .isBillingAddressAdd
                                                          .value ==
                                                      false
                                                  ? 60
                                                  : 82,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: CustomAppColors
                                                      .borderColor,
                                                ),
                                                color:
                                                    CustomAppColors.cardBGColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                              child: Center(
                                                child: CustomeTextStyle(
                                                  text: controller
                                                              .isBillingAddressAdd
                                                              .value ==
                                                          false
                                                      ? "Add"
                                                      : "Change",
                                                  size: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: CustomAppColors
                                                      .lblOrgColor,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              print('Change Address');
                                              Get.toNamed(Routes
                                                  .PROFILESHIPPINGADDRESSROUTES);
                                            },
                                            child: Container(
                                              width: 82,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color:
                                                    CustomAppColors.cardBGColor,
                                                border: Border.all(
                                                  width: 1,
                                                  color: CustomAppColors
                                                      .borderColor,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                              child: Center(
                                                child: CustomeTextStyle(
                                                  text: "Change",
                                                  size: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: CustomAppColors
                                                      .lblOrgColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                          12.widthBox,
                                          InkWell(
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              print('Shipping address');
                                              Get.toNamed(Routes
                                                  .PROFILESHIPPINGADDRESSROUTES);
                                            },
                                            child: Container(
                                              width: 160,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color:
                                                    CustomAppColors.cardBGColor,
                                                border: Border.all(
                                                  width: 1,
                                                  color: CustomAppColors
                                                      .borderColor,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                              child: Center(
                                                child: CustomeTextStyle(
                                                  text: "Shipping addresses",
                                                  size: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: CustomAppColors
                                                      .lblOrgColor,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: CustomeTextStyle(
                                              text: "Payment Method",
                                              size: 16,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  CustomAppColors.lblDarkColor,
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
                                      width:
                                          controller.isPaymentMethodAdd.value ==
                                                  false
                                              ? (screenSize.width - 118)
                                              : (screenSize.width - 140),
                                      // color: Colors.blue,
                                      child: controller
                                                  .isPaymentMethodAdd.value ==
                                              false
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text: "Add a payment method",
                                                  size: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      CustomAppColors.lblColor,
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
                                                      AppImages
                                                          .ProfileCreditCardIcon,
                                                      height: 35,
                                                      width: 30,
                                                    ),
                                                  ),
                                                  12.widthBox,
                                                  Container(
                                                    child: ListTile(
                                                      title: const Text(
                                                          'Lafayette'),
                                                      leading: Radio<
                                                          SingingCharacter>(
                                                        value: SingingCharacter
                                                            .lafayette,
                                                        groupValue: _character,
                                                        onChanged:
                                                            (SingingCharacter?
                                                                value) {
                                                          setState(() {
                                                            _character = value;
                                                          });
                                                        },
                                                      ),
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
                                        print('Click Add Payment Method');
                                        controller.isPaymentMethodAdd.value ==
                                                false
                                            ? Get.toNamed(Routes
                                                .PROFILENEWCREDITCARROUTES)
                                            : Get.toNamed(Routes
                                                .PROFILEPAYMENTLISTROUTES);
                                      },
                                      child: Container(
                                        width: controller
                                                    .isPaymentMethodAdd.value ==
                                                false
                                            ? 60
                                            : 82,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: CustomAppColors.cardBGColor,
                                          border: Border.all(
                                            width: 1,
                                            color: CustomAppColors.borderColor,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: Center(
                                          child: CustomeTextStyle(
                                            text: controller.isPaymentMethodAdd
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        text: "Rs " +
                                            '${checkOutController.addToCartList.cartTotals?.subtotal}',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        text: "Rs " +
                                            '${checkOutController.addToCartList.cartTotals?.discount_total}',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        text: "Rs " +
                                            '${checkOutController.addToCartList.cartTotals?.shipping_total}',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        text: "Rs " +
                                            '${checkOutController.addToCartList.cartTotals?.total}',
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
                                      controller.isDiscountCodeAdd.value =
                                          false;
                                      return null;
                                    } else {
                                      controller.strDiscount.value = strCode;
                                      controller.isDiscountCodeAdd.value = true;
                                      return null;
                                    }
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  obscureText: false,
                                  controller: null,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor:
                                      CustomAppColors.txtPlaceholderColor,
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
                                        bottom:
                                            0), // add padding to adjust text
                                    isDense: true,
                                    border: InputBorder.none,
                                    hintText: 'Enter discount code',
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color:
                                          CustomAppColors.txtPlaceholderColor,
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
                                  print('Click Add Discount Code');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.lblDarkColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
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
        ),
      ),
    );
  }
}*/

// class AlertDialogShow extends StatelessWidget {
//   // showAlertDialog(BuildContext context) {
//   //
//   //   // set up the button
//   //   Widget okButton = TextButton(
//   //     child: Text("OK"),
//   //     onPressed: () { },
//   //   );
//   //
//   //   // set up the AlertDialog
//   //   AlertDialog alert = AlertDialog(
//   //     title: Text("My title"),
//   //     content: Text("This is my message."),
//   //     actions: [
//   //       okButton,
//   //     ],
//   //   );
//   //
//   //   // show the dialog
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return alert;
//   //     },
//   //   );
//   // }
//
//   showAlertDialog(BuildContext context) {
//     showDialog<String>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: const Text('AlertDialog Title'),
//         content: const Text('AlertDialog description'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.pop(context, 'OK'),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DialogExample extends StatelessWidget {
//   const DialogExample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: const Text('AlertDialog description'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'Cancel'),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'OK'),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       );
//   }
// }

class Dialog extends StatefulWidget {
  @override
  _DialogState createState() => _DialogState();

  Dialog({Key? key, required this.val}) : super(key: key);
  final double val;
}

class _DialogState extends State<Dialog> {
  double value = 0;

  @override
  void initState() {
    super.initState();
    value = widget.val;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Slider(
        value: value,
        min: 0,
        max: 100,
        onChanged: (va) {
          setState(() {
            value = va;
          });
        },
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
