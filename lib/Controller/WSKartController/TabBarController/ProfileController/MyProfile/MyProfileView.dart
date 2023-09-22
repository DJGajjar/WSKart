import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'MyProfileController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';

class MyProfileView extends GetView<MyProfileController> {
  const MyProfileView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomeTextStyle(
          text: "My Profile",
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
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                Container(
                  height: 74,
                  // color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 74,
                        width: 74,
                        // color: CustomAppColors.lblOrgColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: CustomAppColors.lblOrgColor,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage(AppImages.ProfileAvtar),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: CustomAppColors.cardBGColor,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(AppImages.ProfileEdit),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Container(
                            height: 74,
                            // color: Colors.green,
                            child: CustomeTextStyle(
                              text: "Guy Hawkins",
                              size: 28,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                    validator: (FirstName) {
                      if (FirstName == null || FirstName.isEmpty) {
                        controller.strFirstName.value = 'No';
                        controller.isFirstName.value = false;
                        return null;
                      } else {
                        controller.strFirstName.value = FirstName;
                        controller.isFirstName.value = true;
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
                      hintText: 'First Name',
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
                    validator: (LastName) {
                      if (LastName == null || LastName.isEmpty) {
                        controller.strLastName.value = 'No';
                        controller.isLastName.value = false;
                        return null;
                      } else {
                        controller.strLastName.value = LastName;
                        controller.isLastName.value = true;
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
                      hintText: 'Last Name',
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
                    validator: (UserName) {
                      if (UserName == null || UserName.isEmpty) {
                        controller.strUserName.value = 'No';
                        controller.isUserName.value = false;
                        return null;
                      } else {
                        controller.strUserName.value = UserName;
                        controller.isUserName.value = true;
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
                      hintText: 'UserName',
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
                        controller.strEmailAddress.value = 'No';
                        controller.isEmailAddress.value = false;
                        return null;
                      } else {
                        controller.strEmailAddress.value = EmailAddress;
                        controller.isEmailAddress.value = true;
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
                      hintText: 'Email Address',
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
                    text: "Change password",
                    size: 28,
                    fontWeight: FontWeight.w600,
                    color: CustomAppColors.lblDarkColor,
                    wordSpacing: 0.5,
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
                    validator: (CurrentPassword) {
                      if (CurrentPassword == null || CurrentPassword.isEmpty) {
                        controller.strCurrentPassword.value = 'No';
                        controller.isCurrentPassword.value = false;
                        return null;
                      } else {
                        controller.strCurrentPassword.value = CurrentPassword;
                        controller.isCurrentPassword.value = true;
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
                      hintText: 'Current password',
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
                    validator: (NewPassword) {
                      if (NewPassword == null || NewPassword.isEmpty) {
                        controller.strNewPassword.value = 'No';
                        controller.isNewPassword.value = false;
                        return null;
                      } else {
                        controller.strNewPassword.value = NewPassword;
                        controller.isNewPassword.value = true;
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
                      hintText: 'New password',
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
                    validator: (ConfirmPassword) {
                      if (ConfirmPassword == null || ConfirmPassword.isEmpty) {
                        controller.strConfirmPassword.value = 'No';
                        controller.isConfirmPassword.value = false;
                        return null;
                      } else {
                        controller.strConfirmPassword.value = ConfirmPassword;
                        controller.isConfirmPassword.value = true;
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
                      hintText: 'Confirm new password',
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
                32.heightBox,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 56,
                  child: RoundedButton(
                    btnName: 'Save change',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
