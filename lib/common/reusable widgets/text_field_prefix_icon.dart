import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';

class TextfieldPrefixIcon extends StatefulWidget {
  //const name({super.key});
  TextEditingController controller;
  String hintText;
  bool obscureText; 
  bool boolonTap;
  IconData? icon;
  TextfieldPrefixIcon(
      {super.key,
      required this.controller,
      this.obscureText = false,
      required this.hintText,
      required this.icon,
      this.boolonTap = false});

  @override
  State<TextfieldPrefixIcon> createState() => _TextfieldPrefixIconState();
}

class _TextfieldPrefixIconState extends State<TextfieldPrefixIcon> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: Styles.poppins16w400,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintStyle: Styles.poppins16w400,
          hintText: widget.hintText,
          suffixIcon: widget.boolonTap
              ? InkWell(
                  onTap: () {
                    if (widget.boolonTap) {
                      print(widget.obscureText);
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                      });
                    }
                  },
                  child: Icon(
                    widget.obscureText
                        ? Icons.visibility_off
                        : Icons.remove_red_eye,
                    color: widget.obscureText ? Colors.black26 : Colors.black,
                  ))
              : null,
          prefixIcon: Icon(
            widget.icon,
            color: Colors.black,
            //size: 35,
          ),
          border: InputBorder.none,
        ));
  }
}
