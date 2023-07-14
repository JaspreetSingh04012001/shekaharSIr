import 'package:admin/controllers/outletsController.dart';
import 'package:admin/views/Admin/BottomNav/adminBottomnav.dart';
import 'package:admin/views/Admin/adminDrawer.dart';
import 'package:admin/views/OutletManager/managerBottomNav.dart';
import 'package:admin/views/Tables/tables.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../common/app_styles_colors.dart';
import '../../common/reusable widgets/text_field_prefix_icon.dart';
import '../All Outlets/allOutletSales.dart';
import '../Menu/menu.dart';
import '../Operation/operation.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutletsController>(builder: (outletsController) {
     // int currentIndex = 0;
     // int allOutletCurrentIndex = 0;
      // List pages = [
      //   const Tables(),
      //   const Operation(),
      //   const Menu(),
      //   Container(),
      // ];
      // List allOutletPages = [
      //   const AllOutletSales(),
      //   const Operation(),
      //   Container(),
      // ];
      return Scaffold(
          backgroundColor: Colors.white,
          drawer: const AdminDrawer(),
          appBar: AppBar(
            title: InkWell(
              onTap: () {
                showDialog(
                    //barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        content: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    " Select Outlets",
                                    style: Styles.poppins14,
                                    overflow: TextOverflow.ellipsis,
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
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextfieldPrefixIcon(
                                      controller: TextEditingController(),
                                      hintText: "Search",
                                      icon: Icons.search),
                                ),
                              ),
                              Expanded(
                                  child: ListView.builder(
                                      itemCount:
                                          outletsController.outLets!.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            outletsController.setOutlet(
                                                outletsController
                                                    .outLets![index]);
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        Colors.grey.shade200)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: ListTile(
                                                dense: true,
                                                contentPadding: EdgeInsets.zero,
                                                leading: const Icon(
                                                  Icons
                                                      .store_mall_directory_outlined,
                                                  color: Colors.black,
                                                  size: 15,
                                                ),
                                                title: Text(
                                                  outletsController
                                                      .outLets![index],
                                                  style: Styles.poppins12,
                                                ),
                                                trailing: Text(
                                                  "[id : 1009]",
                                                  style: Styles.poppins12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
                              const Gap(3),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                //width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        outletsController.selelctedOutlet ?? "Select Outlet",
                        style: Styles.poppins12
                            .copyWith(fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // const Gap(5),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: outletsController.selelctedOutlet == "All Outlets"
              ? outletsController.adminNavPages[outletsController.bottomTabIndexAllOutlets]
              : outletsController.managerNavPages[outletsController.bottomTabIndex],
          bottomNavigationBar:
              outletsController.selelctedOutlet == "All Outlets"
                  ? const AdminBottomnav()
                  : const ManagerBottomNav());
    });
  }
}
