import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../common/app_styles_colors.dart';

class CaptainsQrcodes extends StatelessWidget {
  String data;
  CaptainsQrcodes({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Captains Qr codes',
          style: Styles.poppins12,
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // shape: const BeveledRectangleBorder(
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(15))),
                            contentPadding: EdgeInsets.zero,
                            //title:
                            content: Container(
                              decoration: BoxDecoration(
                                  borderRadius: Styles.myradius,
                                  color: Colors.white),
                              // color: Colors.white,
                              //  height: MediaQuery.sizeOf(context).height * 0.5,
                              //  wi,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Qr for jass",
                                              style: Styles.poppins14,
                                            ),
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
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 210,
                                        width: 210,
                                        child: QrImageView(
                                          // foregroundColor: Colors.black,
                                          // backgroundColor: Colors.black,
                                          data: data,
                                          version: QrVersions.auto,
                                          size: 200.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                    // Get.dialog();

                    // Container(
                    //   // height: MediaQuery.sizeOf(context).height * 0.4,
                    //   color: Colors.white,
                    //   child: QrImageView(
                    //     data: '1234567890',
                    //     version: QrVersions.auto,
                    //     size: 200.0,
                    //   ),
                    // ));
                    // Get.to();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: Styles.myShadow,
                          color: Colors.white,
                          borderRadius: Styles.myradius2),
                      child: ListTile(
                        leading: const Icon(
                          Icons.qr_code_2,
                          color: Color.fromARGB(255, 164, 14, 3),
                          size: 20,
                        ),
                        title: Text(
                          "Jass Captain",
                          style: Styles.poppins12
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ));
            }),
      ),
    );
  }
}
