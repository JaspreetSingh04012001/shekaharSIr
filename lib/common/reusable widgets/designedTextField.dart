import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_styles_colors.dart';

class DesignedTextField extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? labelText;
  String? Function(String?)? validate;
  List<TextInputFormatter>? inputFormatters;
  DesignedTextField(
      {Key? key,
      this.labelText,
      this.controller,
      this.validate,
      this.keyboardType,this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      //initialValue: serialNumber.toString(),
      //
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: false,
        //errorBorder: const InputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        errorStyle: Styles.poppins14.copyWith(color: Colors.red),
        labelText: labelText,
        labelStyle: Styles.poppins14.copyWith(fontWeight: FontWeight.w400),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          //gapPadding: 10,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: Styles.poppins14,

      // onChanged: (v){

      // },
      validator: validate,
      onSaved: (value) {
        // _menuItem.name = value!;
      },
    );
  }
}
