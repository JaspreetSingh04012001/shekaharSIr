import 'package:admin/common/app_styles_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  List<String> list;
  String? selectedValue;
  String? labelText;
  void Function(String?)? onChanged;
  MyDropdown(
      {Key? key,
      required this.list,
      required this.selectedValue,
      required this.onChanged,
    required  this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: Styles.myradius2,
        //boxShadow: Styles.myShadow
      ),
      child: DropdownButton2<String>(
        //isDense: true,
        underline: Container(),
        alignment: Alignment.centerLeft,
        // isDense: true,
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            labelText ?? '',
            style: Styles.poppins14.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        items: list
            .map((String item) => DropdownMenuItem<String>(
                  alignment: Alignment.centerLeft,
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(item,
                        style: Styles.poppins14.copyWith(
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: onChanged,

        dropdownStyleData: DropdownStyleData(
          maxHeight: 1000,
          width: MediaQuery.sizeOf(context).width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          // height: 40,

          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        ),
      ),
    );
  }
}
