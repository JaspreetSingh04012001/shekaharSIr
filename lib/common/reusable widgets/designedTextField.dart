import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_styles_colors.dart';

class DesignedTextField extends StatelessWidget {
  TextEditingController? controller;
  void Function(String)? onChanged;
  TextInputType? keyboardType;
  String? labelText;
  String? Function(String?)? validate;
  bool? enabled;
  List<TextInputFormatter>? inputFormatters;
  DesignedTextField(
      {Key? key,
      this.labelText,
      this.controller,this.enabled,
      this.validate,this.onChanged,
      this.keyboardType,this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
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
