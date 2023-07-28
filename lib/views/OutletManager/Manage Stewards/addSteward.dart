import 'package:admin/Models/steward.dart';
import 'package:admin/common/reusable%20widgets/designedTextField.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/reuseable%20Widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_styles_colors.dart';

class AddSteward extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AddSteward({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutletsController>(builder: (outletsController) {
      return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Enter Steward Details",
                  style: Styles.poppins14,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: Styles.primaryColor,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DesignedTextField(
                controller: id,
                labelText: "Steward Id",
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Cannot be empty';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DesignedTextField(
                controller: name,
                labelText: "Steward Name",
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Cannot be empty';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DesignedTextField(
                controller: phone,
                labelText: "Phone Number",
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Cannot be empty';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DesignedTextField(
                controller: address,
                labelText: "Address",
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Cannot be empty';
                  }
                  return null;
                },
              ),
            ),
            CustomButton(
              buttonText: "Add",
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  outletsController.updateOutletStewards(Steward.fromJson({
                    'AutoCode':
                        outletsController.selelctedOutlet!.activeStewards ==
                                null
                            ? "0"
                            : outletsController
                                .selelctedOutlet!.activeStewards!.length
                                .toString(),
                    "id": id.text.toString(),
                    'Steward_Name': name.text.toString(),
                    'PHONE': phone.text.toString(),
                    'ADDRESS': address.text.toString()
                  }));
                  Future.delayed(const Duration(seconds: 1)).whenComplete(() {
                    Navigator.pop(context);
                  });
                }
              },
            )
          ],
        ),
      );
    });
  }
}
