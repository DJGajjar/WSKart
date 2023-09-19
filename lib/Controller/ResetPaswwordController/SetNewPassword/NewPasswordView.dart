import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'NewPasswordController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    String strNewPassword = '';
    String strConfirmPassword = '';

    bool isNewPasswordNull = false;
    bool isConfirmPasswordNull = false;

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                44.heightBox,
                Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Image.asset(AppImages.BackIcon),
                            iconSize: 28,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomeTextStyle(
                        text: "Reset password",
                        size: 13,
                        fontWeight: FontWeight.w700,
                        color: CustomAppColors.lblDarkColor,
                        wordSpacing: 1,
                      ),
                    ),
                  ],
                ),
                44.heightBox,
                Container(
                  width: 124,
                  height: 92,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.appLogo),
                    ),
                  ),
                ),
                44.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 1,
                  color: CustomAppColors.borderColor,
                ),
                32.heightBox,
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 48),
                  child: CustomeTextStyle(
                    text: "Set a new password",
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: CustomAppColors.lblDarkColor,
                    wordSpacing: 4,
                    textAlign: TextAlign.center,
                  ),
                ),
                20.heightBox,
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 48),
                  child: CustomeTextStyle(
                    text:
                        "You new password must be different from previously used passwords",
                    size: 16,
                    fontWeight: FontWeight.normal,
                    color: CustomAppColors.txtPlaceholderColor,
                    wordSpacing: 4,
                    textAlign: TextAlign.center,
                  ),
                ),
                32.heightBox,
                Obx(
                  () => Container(
                    height: 56,
                    width: (MediaQuery.of(context).size.width - 48),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: CustomAppColors.borderColor),
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    child: TextFormField(
                      validator: (NewPass) {
                        if (NewPass == null || NewPass.isEmpty) {
                          strNewPassword = 'No';
                          isNewPasswordNull = false;
                          return null;
                        } else {
                          strNewPassword = NewPass;
                          isNewPasswordNull = true;
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: controller.isNewPasswordVisible.value,
                      controller: null,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: CustomAppColors.txtPlaceholderColor,
                      cursorWidth: 2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: CustomAppColors.txtPlaceholderColor,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(controller.isNewPasswordVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            controller.isNewPasswordVisible.value =
                                !controller.isNewPasswordVisible.value;
                          },
                        ),
                        /*suffix: InkWell(
                          child: Icon(
                            controller.isNewPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: CustomAppColors.lblDarkColor,
                            size: 16,
                          ),
                          onTap: () {
                            controller.isNewPasswordVisible.value =
                                !controller.isNewPasswordVisible.value;
                          },
                        ),*/
                        contentPadding: EdgeInsets.only(
                            top: 4,
                            left: 4,
                            bottom: 4), // add padding to adjust text
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
                ),
                16.heightBox,
                Obx(
                  () => Container(
                    height: 56,
                    width: (MediaQuery.of(context).size.width - 48),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: CustomAppColors.borderColor),
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    child: TextFormField(
                      validator: (ConfirmPass) {
                        if (ConfirmPass == null || ConfirmPass.isEmpty) {
                          strConfirmPassword = 'No';
                          isConfirmPasswordNull = false;
                          return null;
                        } else {
                          strConfirmPassword = ConfirmPass;
                          isConfirmPasswordNull = true;
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: controller.isAgainPasswordVisible.value,
                      controller: null,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: CustomAppColors.txtPlaceholderColor,
                      cursorWidth: 2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: CustomAppColors.txtPlaceholderColor,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(controller.isAgainPasswordVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            controller.isAgainPasswordVisible.value =
                                !controller.isAgainPasswordVisible.value;
                          },
                        ),
                        /*suffix: InkWell(
                          child: Icon(
                            controller.isNewPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: CustomAppColors.lblDarkColor,
                            size: 16,
                          ),
                          onTap: () {
                            controller.isNewPasswordVisible.value =
                                !controller.isNewPasswordVisible.value;
                          },
                        ),*/
                        contentPadding: EdgeInsets.only(
                            top: 4,
                            left: 4,
                            bottom: 4), // add padding to adjust text
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'New password again',
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
                ),
                16.heightBox,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 56,
                  child: RoundedButton(
                    btnName: 'Change Password',
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
                      if (formGlobalKey.currentState!.validate()) {
                        print('Enter New Password: $strNewPassword');
                        if (isNewPasswordNull == false) {
                          Get.defaultDialog(
                            title: 'Validation',
                            backgroundColor: CustomAppColors.appWhiteColor,
                            middleText: 'Please Enter New Password',
                            middleTextStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 1,
                              height: 1.2,
                            ),
                            titleStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: CustomAppColors.lblOrgColor,
                              wordSpacing: 1,
                              height: 1.2,
                            ),
                          );
                        } else if (isConfirmPasswordNull == false) {
                          Get.defaultDialog(
                            title: 'Validation',
                            backgroundColor: CustomAppColors.appWhiteColor,
                            middleText: 'Please Enter Confirm Password',
                            middleTextStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 1,
                              height: 1.2,
                            ),
                            titleStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: CustomAppColors.lblOrgColor,
                              wordSpacing: 1,
                              height: 1.2,
                            ),
                          );
                        } else {
                          if (strNewPassword.trim() != '' ||
                              strConfirmPassword.trim() != '') {
                            //Navigation
                          } else {
                            Get.defaultDialog(
                              title: 'Validation',
                              backgroundColor: CustomAppColors.appWhiteColor,
                              middleText: 'Please Enter Valid Password',
                              middleTextStyle: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 1,
                                height: 1.2,
                              ),
                              titleStyle: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: CustomAppColors.lblOrgColor,
                                wordSpacing: 1,
                                height: 1.2,
                              ),
                            );
                          }
                        }
                      } else {
                        Get.defaultDialog(
                          title: 'Validation',
                          backgroundColor: CustomAppColors.appWhiteColor,
                          middleText: 'Please Enter Valid Password',
                          middleTextStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: CustomAppColors.lblDarkColor,
                            wordSpacing: 1,
                            height: 1.2,
                          ),
                          titleStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: CustomAppColors.lblOrgColor,
                            wordSpacing: 1,
                            height: 1.2,
                          ),
                        );
                      }
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
