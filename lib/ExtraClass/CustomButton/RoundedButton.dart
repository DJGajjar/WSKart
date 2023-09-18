import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wskart/ExtraClass/AppColor.dart';

class RoundedButton extends StatefulWidget {
  const RoundedButton(
      {required this.btnName,
      this.btnIcon,
      this.btnBGColor = Colors.black,
      this.btnStyle,
      this.callback,
      Key? key})
      : super(key: key);

  final String btnName;
  final Icon? btnIcon;
  final Color? btnBGColor;
  final TextStyle? btnStyle;
  final VoidCallback? callback;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // elevation: 16,
      color: CustomAppColors.lblDarkColor,
      // shadowColor: CustomAppColors.lblOrgColor,
      child: Expanded(
        child: ElevatedButton(
          onPressed: () {
            widget.callback!();
          },
          child: Text(
            widget.btnName,
            style: widget.btnStyle,
            textAlign: TextAlign.end,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.btnBGColor,
            shadowColor: widget.btnBGColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ).px(12).py(2.5),
      ),
    );
  }
}
