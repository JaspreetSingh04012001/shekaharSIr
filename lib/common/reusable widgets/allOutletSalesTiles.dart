import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';

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
    return Stack(
      children: [
        Container(
          // padding: const EdgeInsets.symmetric(vertical: 5),
          height: 100,
          //width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
              borderRadius: Styles.myradius,
              boxShadow: Styles.myShadow,
              color: Colors.white),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: CircleAvatar(
                        radius: 15,
                        //foregroundColor: Colors.amber,
                        child: circleAvatarChild,
                      ),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tittle,
                            style: Styles.poppins.copyWith(color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "$quantity",
                              style: Styles.poppins18w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.info, color: Colors.grey),
                      Expanded(
                        child: Text(
                          tittle2,
                          maxLines: 1,
                          style: Styles.poppins.copyWith(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ],
    );
  }
}
