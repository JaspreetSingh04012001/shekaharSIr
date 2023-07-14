import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  bool val;
  String text;

  MyCheckBox({super.key, required this.val, required this.text});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: const BorderSide(
                width: 3,
                color: Colors.black, // Add a border to make it more visible
              ),
            ),
            activeColor:
                Colors.blue, // Customize the checkbox's color when checked
            checkColor: Colors.white, // Customize the check icon's color
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              // Customize the checkbox's color when unchecked
              if (states.contains(MaterialState.selected)) {
                return Styles
                    .primaryColor; // Make it semi-transparent when unchecked
              }
              return Colors.black;
            }),
            value: widget.val,
            onChanged: (v) {
              setState(() {
                widget.val = !widget.val;
              });
            }),
        // const Gap(5),
        Text(
          widget.text,
          style: Styles.poppins14,
        )
      ],
    );
  }
}
