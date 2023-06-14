import 'package:admin/views/Orders/tableOrder.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../../common/app_styles_colors.dart';

class VacantTables extends StatefulWidget {
  int number;
  bool isDelivery;
  String image;
  String type;
  VacantTables(
      {Key? key,
      this.isDelivery = false,
      required this.number,
      required this.type,
      required this.image})
      : super(key: key);

  @override
  _VacantTablesState createState() => _VacantTablesState();
}

class _VacantTablesState extends State<VacantTables> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>Get.to(TableOrder()) ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Table No.${widget.number}",
                //  style: Styles.poppins16w400,
              ),
              Text(
                "Vaccant",
                style: Styles.poppins16w400
                    .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 80,
                child: SizedBox(
                  height: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      widget.image,
                      // color: Colors.red.shade50,
    
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                widget.type,
                //  style: Styles.poppins16w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
