import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';

class SalesTiles extends StatelessWidget {
  Widget circleAvatarChild;
  String tittle;
  String orders;
  String amount;
  SalesTiles(
      {Key? key,
      required this.circleAvatarChild,
      required this.tittle,
      required this.orders,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 0, bottom: 0),
      child: ListTile(
        //  isThreeLine: true,

        title: Text(
          tittle,
          style: Styles.poppins16w400.copyWith(fontSize: 14),
          //style: TextStyle(fontSize: 15),
        ),
        contentPadding: EdgeInsets.zero,
        subtitle: Text(
          "$orders Orders",
          style:
              Styles.poppins16w400.copyWith(color: Colors.grey, fontSize: 13),
        ),
        leading: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.grey.shade200,
            child: circleAvatarChild),
        trailing: SizedBox(
          //color: Colors.amber,
          width: 120,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            const Text(
              "₹",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(amount,
                style: Styles.poppins16w400.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const Icon(
              Icons.more_vert,
              color: Colors.grey,
            )
            // IconButton(
            //     padding: EdgeInsets.zero,
            //     onPressed: () {},
            //     icon: const Icon(
            //       Icons.more_vert,
            //       color: Colors.grey,
            //       //  size: 20,
            //     ))
          ]),
        ),
      ),
    );
  }
}
