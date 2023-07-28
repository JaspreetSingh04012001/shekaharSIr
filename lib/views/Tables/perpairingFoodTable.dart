import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../common/app_styles_colors.dart';

class PerpairingFoodTable extends StatefulWidget {
  String tableId;

  String imageLink;
  String type;
  String tittle;
  PerpairingFoodTable(
      {Key? key,
      required this.tableId,
      required this.imageLink,
      required this.type,
      required this.tittle})
      : super(key: key);

  @override
  State<PerpairingFoodTable> createState() => _PerpairingFoodTableState();
}

class _PerpairingFoodTableState extends State<PerpairingFoodTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 196, 237, 198),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Id : ${widget.tableId}",
              //  style: Styles.poppins16w400,
            ),
            Text(
              widget.tittle,
              style: Styles.poppins16w400
                  .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Lottie.network(
              widget.imageLink,
              height: 80,
              fit: BoxFit.contain,
            ),
            Text(
              widget.type,
              //  style: Styles.poppins16w400,
            )
          ],
        ),
      ),
    );
  }
}
