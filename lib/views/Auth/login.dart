import 'dart:convert';

import 'package:admin/Models/outlet.dart';
import 'package:admin/Models/steward.dart';
import 'package:admin/Models/table.dart' as t;
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/views/Admin/adminHome.dart';
import 'package:admin/views/OutletManager/managerHome.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

import '../../common/app_styles_colors.dart';
import '../../reuseable Widgets/customButton.dart';
import '../Captain/captainHome.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;
  // TextEditingController usernames = new TextEditingController();
  TextEditingController password = TextEditingController();
  String? selectedrole;
  final List<String> roles = [
    'Admin',
    'Outlet Manager',
    'Captain',
    'web Order'
  ];
  Widget textfield = Container();
  bool osbsure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage("assets/ella-olsson-oPBjWBCcAEo-unsplash.jpg"),
                fit: BoxFit.cover)),
        // color: Colors.white,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: Styles.myradius2,
              // boxShadow: Styles.myShadow
            ),

            // height: MediaQuery.sizeOf(context).height * 0.5,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: Styles.myradius2,
                        //boxShadow: Styles.myShadow
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          alignment: Alignment.center,
                          //  isDense: true,
                          isExpanded: true,
                          hint: Text(
                            'Select Role',
                            style: Styles.poppins14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          items: roles
                              .map((String item) => DropdownMenuItem<String>(
                                    alignment: Alignment.center,
                                    value: item,
                                    child: Text(item,
                                        style: Styles.poppins14.copyWith(
                                          // fontSize: 18,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ))
                              .toList(),
                          value: selectedrole,
                          onChanged: (value) {
                            //print(value);
                            setState(() {
                              selectedrole = value;
                            });
                            if (value == 'Captain') {
                              textfield = Container();
                              _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                                  context: context,
                                  onCode: (code) {
                                    if (code != null) {
                                      Map data = jsonDecode(code);

                                      if (data.containsKey('token') &&
                                          data.containsKey('outletId') &&
                                          data.containsKey('CaptainId')) {
                                        Get.find<OutletsController>()
                                            .setOutlet(data['outletId']);
                                        // Get.find<StewardController>()
                                        //     .setSelectedCapatin(Captain(
                                        //         id: data['CaptainId'],
                                        //         name: data['CaptainName']));
                                        Get.to(const CaptainHome());
                                      } else {
                                        Get.showSnackbar(GetSnackBar(
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.red,
                                          title: "Not found",
                                          titleText: Text(
                                            "QR Code does not belongs to this app",
                                            style: Styles.poppins14
                                                .copyWith(color: Colors.white),
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ));
                                      }
                                    }

                                    // setState(() {
                                    //   this.code = code;
                                    // });
                                  });
                            } else {
                              textfield = Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: password,
                                  obscureText: osbsure,
                                  //initialValue: serialNumber.toString(),

                                  decoration: InputDecoration(
                                    // alignLabelWithHint: true,
                                    suffixIcon: osbsure
                                        ? InkWell(
                                            onTap: () {
                                              setState(() {
                                                osbsure = false;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.visibility_off,
                                              color: Colors.black,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              setState(() {
                                                osbsure = true;
                                              });
                                            },
                                            child: Icon(
                                              Icons.visibility,
                                              color: Styles.primaryColor,
                                            ),
                                          ),
                                    //errorBorder: const InputBorder(),

                                    errorStyle: Styles.poppins16w400
                                        .copyWith(color: Colors.red),
                                    labelText: 'Enter Password',

                                    labelStyle: Styles.poppins14,
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: const TextStyle(fontSize: 16.0),
                                  // onChanged: (v){

                                  // },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter password';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    // _menuItem.name = value!;
                                  },
                                ),
                              );
                            }
                          },

                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 1000,
                            width: double.infinity,
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
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  textfield,
                  CustomButton(
                    onTap: () {
                      Get.find<OutletsController>().setOutletsList([
                        Outlet.fromJson({
                          'AutoCode': '0',
                          'outletName': "All Outlets",
                          'bar': true,
                          'discontinue': false,
                          'KITCHEN': '',
                          'outletStartDate': DateTime.now(),
                          'activeStewards': [
                            Steward.fromJson({
                              'AutoCode': '0',
                              'Steward_Name': '',
                              'PHONE': '',
                              'ADDRESS': '',
                              'FNAME': '',
                              'ON_ROLL': '',
                              'STEW_TYPE': '',
                              'SELF_SRV': '',
                            }),
                          ],
                          'tables': [
                            t.Table.fromJson({
                              'AutoCode': '0',
                              'isOcupied': false,
                              'isComplimentary': false,
                              'isNormal': false,
                              'isFastFood': false,
                              'isDelivery': false,
                              'isFoodprepairing': false,
                            })
                          ],
                        }),
                        Outlet.fromJson({
                          'AutoCode': '1',
                          'outletName': "jass Restaurant",
                          'bar': true,
                          'discontinue': false,
                          'KITCHEN': '',
                          'outletStartDate': DateTime.now(),
                          'activeStewards': [
                            Steward.fromJson({
                              'AutoCode': '0',
                              'Steward_Name': '',
                              'PHONE': '',
                              'ADDRESS': '',
                              'FNAME': '',
                              'ON_ROLL': '',
                              'STEW_TYPE': '',
                              'SELF_SRV': '',
                            }),
                          ],
                          'tables': [
                            t.Table.fromJson({
                              'AutoCode': '1',
                              'isOcupied': false,
                              'isComplimentary': false,
                              'isNormal': true,
                              'isFastFood': false,
                              'isDelivery': false,
                              'isFoodprepairing': false,
                            }),
                            t.Table.fromJson({
                              'AutoCode': '2',
                              'isOcupied': false,
                              'isComplimentary': false,
                              'isNormal': true,
                              'isFastFood': false,
                              'isDelivery': false,
                              'isFoodprepairing': false,
                            }),
                            t.Table.fromJson({
                              'AutoCode': '3',
                              'isOcupied': false,
                              'isComplimentary': false,
                              'isNormal': true,
                              'isFastFood': false,
                              'isDelivery': false,
                              'isFoodprepairing': false,
                            }),
                            t.Table.fromJson({
                              'AutoCode': '4',
                              'isOcupied': false,
                              'isComplimentary': false,
                              'isNormal': true,
                              'isFastFood': false,
                              'isDelivery': false,
                              'isFoodprepairing': false,
                            }),
                            t.Table.fromJson({
                              'AutoCode': '5',
                              'isOcupied': false,
                              'isComplimentary': false,
                              'isNormal': true,
                              'isFastFood': false,
                              'isDelivery': false,
                              'isFoodprepairing': false,
                            }),
                          ],
                        }),
                      ]);
                      switch (selectedrole) {
                        case 'Admin':
                          Get.find<OutletsController>().setOutlet(0);
                          Get.offAll(const AdminHome());

                          break;
                        case 'Outlet Manager':
                          Get.find<OutletsController>().setOutlet(1);
                          Get.offAll(const ManagerHome());

                          break;
                        case 'Captain':
                          break;
                        default:
                      }
                      // _variationformKey.currentState.validate();
                    },
                    height: 60,
                    buttonText: "Login",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
