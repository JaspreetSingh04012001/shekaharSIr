import 'package:admin/views/Cart/cart.dart';
import 'package:admin/views/Orders/menuForOrder.dart';
import 'package:flutter/material.dart';

import '../../common/app_styles_colors.dart';

class TableOrder extends StatefulWidget {
  const TableOrder({Key? key}) : super(key: key);

  @override
  _TableOrderState createState() => _TableOrderState();
}

class _TableOrderState extends State<TableOrder> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Place Order for Table Id.",
              style: Styles.poppins18w600,
            ),
          ),
          backgroundColor: Colors.white,
          body: size > 650
              ? Container(
                  child: const Row(children: [
                    Expanded(flex: 3, child: MenuForOrder()),
                    Expanded(flex: 2, child: Cart()),
                    // Flexible(
                    //     flex: 2,
                    //     child: Container(
                    //       color: Colors.black,
                    //     ))
                  ]),
                )
              : const MenuForOrder()),
    );
  }
}
