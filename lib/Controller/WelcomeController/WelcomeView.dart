import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'WelcomeController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:flutter/material.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.welcomeBanner),
                    fit: BoxFit.cover,
                    alignment: Alignment.center))),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: (MediaQuery.of(context).size.height - 100),
            ),
            Center(
                child: ElevatedButton(
              onPressed: () {
                print('Press Welcome button');
                controller.WelcomeSwipeUp();
              },
              child: Text(
                "Swipe Up",
                style: TextStyle(
                    fontSize: 20.0, color: CustomAppColors.appBGColor),
              ),
            ))
          ],
        ),
      ],
    )
        /*Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.welcomeBanner), fit: BoxFit.cover),
      ),
    )*/
        /*Container(
        // width: double.infinity,
        // height: double.infinity,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.welcomeBanner),
            fit: BoxFit.cover,
          ),
        ),
        child: ElevatedButton(
          child: const Text("Login"),
          onPressed: () {
            // controller.login();
          },
        ),
      ),*/
        );
  }
}
