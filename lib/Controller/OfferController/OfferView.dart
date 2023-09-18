import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'OfferController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';

class OfferView extends GetView<OfferController> {
  const OfferView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.offerBanner),
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
                print('Press Offer Button');
                controller.OfferSwipeUp();
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.offerBanner),
            fit: BoxFit.fill,
          ),
        ),
      ),*/
        );
  }
}
