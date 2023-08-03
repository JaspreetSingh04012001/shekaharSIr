import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RightBoldText extends StatelessWidget {
  String title;
  String val;
  RightBoldText({Key? key, required this.title, required this.val})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$title : ",
          style: Styles.poppins14,
        ),
        const Gap(5),
        Text(
          val,
          style: Styles.poppins16w500,
        )
      ],
    );
  }
}
