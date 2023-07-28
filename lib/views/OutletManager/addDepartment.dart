import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/common/reusable%20widgets/designedTextField.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/reuseable%20Widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddDepartment extends StatelessWidget {
  bool department;
  final TextEditingController controller = TextEditingController();
  AddDepartment({Key? key, required this.department}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          department ? "Departments" : "Categories",
          style: Styles.poppins14w400,
        ),
      ),
      body: GetBuilder<OutletsController>(builder: (outletsController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${outletsController.selelctedOutlet!.outletName}"),
            department
                ? (outletsController.selelctedOutlet!.departements == null ||
                        outletsController
                            .selelctedOutlet!.departements!.isEmpty)
                    ? Expanded(
                        child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "No Department Exists",
                          style: Styles.poppins14w400,
                        ),
                      ))
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: outletsController
                                .selelctedOutlet!.departements!.reversed
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: Styles.myradius2,
                                            boxShadow: Styles.myShadow),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Gap(10),
                                              Text(
                                                e,
                                                style: Styles.poppins14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                : (outletsController.selelctedOutlet!.categories == null ||
                        outletsController.selelctedOutlet!.categories!.isEmpty)
                    ? Expanded(
                        child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "No Categories Exists",
                          style: Styles.poppins14w400,
                        ),
                      ))
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: outletsController
                                .selelctedOutlet!.categories!.reversed
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: Styles.myradius2,
                                            boxShadow: Styles.myShadow),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Gap(10),
                                              Text(
                                                e,
                                                style: Styles.poppins14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: Styles.myradius2,
                    boxShadow: Styles.myShadow),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Gap(10),
                      DesignedTextField(
                        controller: controller,
                        labelText:
                            department ? "Department Name" : "Category Name",
                      ),
                      CustomButton(
                        buttonText:
                            department ? "Add Department" : "Add Category",
                        onTap: () {
                          if (controller.text.isEmpty) {
                            Get.snackbar(
                                "Name is empty",
                                department
                                    ? "Department name cannot be empty"
                                    : "Category name cannot be empty",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white);
                          } else {
                            department
                                ? outletsController.updateOutletDepartment(
                                    controller.text.toString())
                                : outletsController.updateOutletCategories(
                                    controller.text.toString());
                            controller.clear();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
