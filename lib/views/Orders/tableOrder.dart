import 'package:flutter/material.dart';

import '../../Services/utils.dart';

class TableOrder extends StatefulWidget {
  const TableOrder({Key? key}) : super(key: key);

  @override
  _TableOrderState createState() => _TableOrderState();
}

class _TableOrderState extends State<TableOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: ResponsiveHelper.isTab(context)
          ? Container(
              color: Colors.red,
              child: Row(children: [
                Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.amber,
                      child: ListView.builder(itemBuilder: (context, index) {
                        return Container();
                      }),
                    )),
                Flexible(
                    flex: 2,
                    child: Container(
                      color: Colors.green,
                    )),
                // Flexible(
                //     flex: 2,
                //     child: Container(
                //       color: Colors.black,
                //     ))
              ]),
            )
          : Container(),
    );
  }
}
