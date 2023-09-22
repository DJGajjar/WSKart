import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../ExtraClass/Routes/AppPages.dart';
import 'ContactUsController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomeTextStyle(
          text: "Contact Us",
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
                38.heightBox,
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 48,
                  child: CustomeTextStyle(
                    text: "Get in touch",
                    size: 28,
                    fontWeight: FontWeight.w600,
                    color: CustomAppColors.lblDarkColor,
                    wordSpacing: 0.5,
                  ),
                ),
                18.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 56,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: CustomAppColors.borderColor),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: TextFormField(
                    validator: (FullName) {
                      if (FullName == null || FullName.isEmpty) {
                        controller.strFullName.value = 'No';
                        controller.isFullName.value = false;
                        return null;
                      } else {
                        controller.strFullName.value = FullName;
                        controller.isFullName.value = true;
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: false,
                    controller: null,
                    keyboardType: TextInputType.name,
                    cursorColor: CustomAppColors.txtPlaceholderColor,
                    cursorWidth: 2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CustomAppColors.lblDarkColor,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 4,
                          left: 10,
                          bottom: 0), // add padding to adjust text
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Full name',
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
                16.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 56,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: CustomAppColors.borderColor),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: TextFormField(
                    validator: (EmailAddress) {
                      if (EmailAddress == null || EmailAddress.isEmpty) {
                        controller.strEmail.value = 'No';
                        controller.isEmail.value = false;
                        return null;
                      } else {
                        controller.strEmail.value = EmailAddress;
                        controller.isEmail.value = true;
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
                      color: CustomAppColors.lblDarkColor,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 4,
                          left: 10,
                          bottom: 0), // add padding to adjust text
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Email',
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
                16.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 192,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: CustomAppColors.borderColor),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: TextFormField(
                    maxLines: 50,
                    validator: (Message) {
                      if (Message == null || Message.isEmpty) {
                        controller.strMessage.value = 'No';
                        controller.isMessage.value = false;
                        return null;
                      } else {
                        controller.strMessage.value = Message;
                        controller.isMessage.value = true;
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: false,
                    controller: null,
                    keyboardType: TextInputType.name,
                    cursorColor: CustomAppColors.txtPlaceholderColor,
                    cursorWidth: 2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CustomAppColors.lblDarkColor,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 4,
                          left: 10,
                          bottom: 0), // add padding to adjust text
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Message',
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
                20.heightBox,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 56,
                  child: RoundedButton(
                    btnName: 'Submit',
                    btnBGColor: Colors.transparent,
                    btnStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: CustomAppColors.appWhiteColor,
                      wordSpacing: 1,
                      height: 1.2,
                    ),
                    callback: () {
                      print('Save change');
                    },
                  ),
                ),
                32.heightBox,
                Container(
                  height: 1,
                  width: (MediaQuery.of(context).size.width - 48),
                  color: CustomAppColors.borderColor,
                ),
                32.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  child: CustomeTextStyle(
                    text: "Who we are",
                    size: 28,
                    fontWeight: FontWeight.w600,
                    color: CustomAppColors.lblDarkColor,
                    wordSpacing: 0.5,
                  ),
                ),
                20.heightBox,
                Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text:
                                "We were founded in June 2020 as an international e-commerce platform that not only provides online shoppers a simple, secure, and enjoyable online shopping experience, but also plays as a solution for global vendors to optimize sales revenue.",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: CustomAppColors.lblColor,
                              wordSpacing: 0.5,
                              height: 1.2,
                            )),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                32.heightBox,
                Card(
                  color: CustomAppColors.cardBGColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Container(
                      width: double.infinity,
                      height: 116,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 56,
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppImages.ProfileContactLocation,
                                        height: 24,
                                        width: 24,
                                      ),
                                    ],
                                  ),
                                ),
                                2.widthBox,
                                Container(
                                  height: 56,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18),
                                    child: CustomeTextStyle(
                                      text: "Contact Office",
                                      size: 13,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblOrgColor,
                                      wordSpacing: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 1, 10, 5),
                            child: Container(
                              child: CustomeTextStyle(
                                text:
                                    "4140 Parker Rd. Allentown, New Mexico 31134",
                                size: 15,
                                fontWeight: FontWeight.w400,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                16.heightBox,
                Card(
                  color: CustomAppColors.cardBGColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Container(
                      width: double.infinity,
                      height: 92,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 16,
                                  padding: const EdgeInsets.only(left: 12),
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
                                2.widthBox,
                                Container(
                                  height: 56,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18),
                                    child: CustomeTextStyle(
                                      text: "Call us",
                                      size: 13,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblOrgColor,
                                      wordSpacing: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 1, 10, 5),
                            child: Container(
                              child: CustomeTextStyle(
                                text: "(239) 555-0108",
                                size: 15,
                                fontWeight: FontWeight.w400,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      )),
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
