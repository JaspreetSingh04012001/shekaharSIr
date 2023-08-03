import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonText;
  double? height;
  double? width;
  double? verPad;
  double? horPad;
  bool shadow;
  Color? color;
  Color? textColor;
  AlignmentGeometry? alignment;
  final GestureTapCallback? onTap;

  CustomButton(
      {Key? key,
      required this.buttonText,
      this.textColor,
      this.color,
      this.shadow = true,
      this.height,
      this.width,
      this.onTap,
      this.verPad,
      this.horPad,
      this.alignment = Alignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: verPad ?? 10, horizontal: horPad ?? 10),
        child: Container(
          alignment: alignment,
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color ?? Styles.primaryColor,
              boxShadow: shadow ? Styles.myShadow : null,
              borderRadius: Styles.myradius2),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              buttonText,
              style: Styles.poppins14.copyWith(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
