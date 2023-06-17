import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllOutletSalesTiles extends StatelessWidget {
  Widget circleAvatarChild;
  var quantity;
  String tittle;
  String tittle2;
  AllOutletSalesTiles(
      {Key? key,
      required this.circleAvatarChild,
      required this.tittle,
      required this.quantity,
      required this.tittle2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 5),
      height: 100,
      //width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          borderRadius: Styles.myradius,
          boxShadow: Styles.myShadow,
          color: Colors.white),
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 5, right: 5),
            //   child: CircleAvatar(
            //     radius: 13,
            //     //foregroundColor: Colors.amber,
            //     child: circleAvatarChild,
            //   ),
            // ),
            const Gap(5),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: CircleAvatar(
                    radius: 10,
                    //foregroundColor: Colors.amber,
                    child: circleAvatarChild,
                  ),
                ),
                Text(
                  tittle,
                  style: Styles.poppins
                      .copyWith(fontSize: 12, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            // Stack(
            //   alignment: Alignment.topLeft,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 5),
            //       child: CircleAvatar(
            //         radius: 11,
            //         //foregroundColor: Colors.amber,
            //         child: circleAvatarChild,
            //       ),
            //     ),
            //     Expanded(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             tittle,
            //             style: Styles.poppins
            //                 .copyWith(fontSize: 12, color: Colors.black),
            //             overflow: TextOverflow.ellipsis,
            //             textAlign: TextAlign.center,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "$quantity",
                style: Styles.poppins16w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Expanded(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info,
                      color: Colors.grey,
                      size: 15,
                    ),
                    const Gap(5),
                    Expanded(
                      child: Text(
                        tittle2,
                        maxLines: 1,
                        style: Styles.poppins
                            .copyWith(fontSize: 11, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
