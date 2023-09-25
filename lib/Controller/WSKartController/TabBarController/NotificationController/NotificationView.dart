import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'NotificationController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var arrNotificationList = [
      {
        'NotificationID': '1',
        'NotificationTitle': '🧥 👗 Promotion each week 👜',
        'NotificationMsg':
            "Shop each week for updates on our weekly special promotions and sales for women's clothing. Click & Collect at shop brands",
      },
      {
        'NotificationID': '2',
        'NotificationTitle': '🎊 Get our promotion program 🎉',
        'NotificationMsg':
            "Looking for CNY outfit ideas? 👚 Shop deals under ${8.88}, up to 80% OFF Under Armour, adidas & more + Extra 18% Cashback voucher inside 👉",
      },
      {
        'NotificationID': '3',
        'NotificationTitle': '📦 Your order is ready',
        'NotificationMsg':
            'Your order has been shipped and delivery to your address in 2 days',
      },
      {
        'NotificationID': '4',
        'NotificationTitle': '🙌 Welcome you to the community',
        'NotificationMsg':
            'Congratulations on your new Account and thank you for choosing us',
      },
    ];

    return arrNotificationList.length != 0
        ? Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView.separated(
                itemCount: arrNotificationList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      print('Setting');
                      // controller.ProfileSettingScreen();
                    },
                    child: Card(
                      color: CustomAppColors.cardBGColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 60,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 24, left: 16, right: 16, bottom: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 10.0, right: 10.0),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: arrNotificationList[index]
                                                  ['NotificationTitle']
                                              .toString(),
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: CustomAppColors.lblColor,
                                            wordSpacing: 0.5,
                                            height: 1.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              5.heightBox,
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 10.0, right: 10.0),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: arrNotificationList[index]
                                                    ['NotificationMsg']
                                                .toString(),
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 0,
                    color: Colors.transparent,
                  );
                }),
          )
        : Scaffold(
            body: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: (MediaQuery.of(context).size.width - 48),
                        color: CustomAppColors.borderColor,
                      ),
                      32.heightBox,
                      Container(
                        width: 82,
                        height: 82,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.NotificationNotFound),
                          ),
                        ),
                      ),
                      18.heightBox,
                      Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width - 48),
                        child: CustomeTextStyle(
                          text: "No Notifications",
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblDarkColor,
                          wordSpacing: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
    ;
  }
}
