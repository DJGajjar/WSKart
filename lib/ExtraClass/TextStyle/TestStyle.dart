import 'package:flutter/material.dart';

class CustomeTextStyle extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final VoidCallback? onClick;
  final TextAlign? textAlign;

  const CustomeTextStyle({
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
    this.onClick,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: onClick == null
          ? Text(
              text,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: fontWeight,
                fontSize: size,
                color: color,
                wordSpacing: wordSpacing,
                height: 1.2,
              ),
              textAlign: textAlign,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          : TextButton(
              onPressed: () {
                onClick?.call();
              },
              child: Text(
                text,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: fontWeight,
                  fontSize: size,
                  color: color,
                  wordSpacing: wordSpacing,
                  height: 1.2,
                ),
                textAlign: textAlign,
              ),
            ),
    );
  }
}
