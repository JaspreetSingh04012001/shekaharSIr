import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/reuseable%20Widgets/animated_dialog.dart';
import 'package:admin/views/OutletManager/Manage%20Stewards/addSteward.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class Stewards extends StatelessWidget {
  const Stewards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutletsController>(builder: (outletsController) {
   //   print(outletsController.selelctedOutlet!.activeStewards!.length);
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Text(
            "${outletsController.selelctedOutlet!.outletName ?? ''} 's stewards",
            style: Styles.poppins16w400,
          ),
        ),
        body: outletsController.selelctedOutlet?.activeStewards == null
            ? Center(
                child: Text(
                "Steward list is empty",
                style: Styles.poppins14.copyWith(color: Colors.black),
              ))
            : Column(
                children: [
                  const Divider(
                    color: Colors.black,
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'Id',
                            style: Styles.poppins14,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            'Name',
                            style: Styles.poppins14,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            'Phone',
                            style: Styles.poppins14,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            'Address',
                            style: Styles.poppins14,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Expanded(
                    child: outletsController
                            .selelctedOutlet!.activeStewards!.isEmpty
                        ? Center(
                            child: Text(
                            "Steward list is empty",
                            style:
                                Styles.poppins14.copyWith(color: Colors.black),
                          ))
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: outletsController
                                .selelctedOutlet!.activeStewards!.length,
                            itemBuilder: (context, index) {
                              print(outletsController
                                  .selelctedOutlet!.activeStewards!.length);
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: Styles.myradius,
                                      color: Colors.white,
                                      boxShadow: Styles.myShadow),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(children: [
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            outletsController
                                                    .selelctedOutlet!
                                                    .activeStewards![index]
                                                    .id ??
                                                '',
                                            style: Styles.poppins14,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Text(
                                            outletsController
                                                    .selelctedOutlet!
                                                    .activeStewards![index]
                                                    .Steward_Name ??
                                                '',
                                            style: Styles.poppins14,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Text(
                                            outletsController
                                                    .selelctedOutlet!
                                                    .activeStewards![index]
                                                    .PHONE ??
                                                '',
                                            style: Styles.poppins14,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Text(
                                            outletsController
                                                    .selelctedOutlet!
                                                    .activeStewards![index]
                                                    .ADDRESS ??
                                                '',
                                            style: Styles.poppins14,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              );
                            }),
                  ),
                ],
              ),
        floatingActionButton: SpeedDial(
          closedForegroundColor: Colors.black,
          openForegroundColor: Colors.white,
          closedBackgroundColor: Colors.white,
          openBackgroundColor: Colors.black,
          labelsStyle: Styles.poppins16w400,
          labelsBackgroundColor: Colors.white,
          // controller: /* Your custom animation controller goes here */,
          speedDialChildren: <SpeedDialChild>[
            SpeedDialChild(
              child: const Icon(Icons.assignment_add),
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              label: 'Add new steward in Outlet',
              onPressed: () {
                showAnimatedDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AddSteward(),
                        ),
                      );
                    });

                //Get.to(AddSteward());
                // Get.to(const AddItem());
              },
              closeSpeedDialOnPressed: true,
            ),
            SpeedDialChild(
              child: const Icon(Icons.remove_from_queue_rounded),
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              label: 'Discontinue steward',
              onPressed: () {
                // inventoryController.removeItem(0);
                // Get.to(const DeleteItem());
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.edit),
              foregroundColor: Colors.white,
              backgroundColor: Colors.amber,
              label: 'Edit steward details',
              onPressed: () {
                // Get.to(const EditItem());
              },
            ),
            //  Your other SpeedDialChildren go here.
          ],
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
