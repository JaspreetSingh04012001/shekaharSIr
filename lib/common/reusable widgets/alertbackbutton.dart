import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';

class Alertbackbutton extends StatelessWidget {
const Alertbackbutton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return   Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Text(
                                //   'Table no. $id',
                                //   style: Styles.poppins16w400,
                                // ),

                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.cancel,
                                      color: Styles.primaryColor,
                                    ))
                              ],
                            );
  }
}