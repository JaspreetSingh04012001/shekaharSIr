import 'package:admin/Services/utils.dart';
import 'package:admin/views/Cart/cart.dart';
import 'package:admin/views/Orders/menuForOrder.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_styles_colors.dart';
import '../../controllers/cartController.dart';
import '../../reuseable Widgets/animated_dialog.dart';

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
    // dynamic size = MediaQuery.of(context).size.width;

    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Place Order for Table Id. ${Get.find<CartController>().selectedTable!.id}",
              style: Styles.poppins18w600,
            ),
            actions: [
              ResponsiveHelper.isMobile(context)
                  ? GetBuilder<CartController>(builder: (cartController) {
                      int itemsLength = 0;
                      if (cartController
                              .tableKot[
                                  cartController.selectedTable!.id.toString()]
                              ?.kotItems !=
                          null) {
                        itemsLength = cartController
                            .tableKot[
                                cartController.selectedTable!.id.toString()]!
                            .kotItems!
                            .length;
                      }

                      return InkWell(
                        onTap: () {
                          showAnimatedDialog(
                              context: context,
                              builder: (context) {
                                return const Cart();
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: badges.Badge(
                            position:
                                badges.BadgePosition.topEnd(top: -15, end: -12),
                            showBadge: true,
                            ignorePointer: true,
                            badgeContent: Text(
                              "$itemsLength",
                              style: Styles.poppins14w400
                                  .copyWith(color: Colors.white),
                            ),
                            badgeAnimation:
                                const badges.BadgeAnimation.rotation(
                              animationDuration: Duration(seconds: 1),
                              colorChangeAnimationDuration:
                                  Duration(seconds: 1),
                              loopAnimation: false,
                              curve: Curves.fastOutSlowIn,
                              colorChangeAnimationCurve: Curves.easeInCubic,
                            ),
                            badgeStyle: badges.BadgeStyle(
                              shape: badges.BadgeShape.circle,
                              badgeColor: Styles.primaryColor,
                              //padding: const EdgeInsets.all(5),
                              // borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0),
                              // borderGradient: const badges.BadgeGradient.linear(
                              //     colors: [Colors.red, Colors.black]),
                              // badgeGradient: const badges.BadgeGradient.linear(
                              //   colors: [Colors.blue, Colors.yellow],
                              //   begin: Alignment.topCenter,
                              //   end: Alignment.bottomCenter,
                              // ),
                              elevation: 1,
                            ),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Styles.primaryColor,
                            ),
                          ),
                        ),
                      );
                    })
                  : Container(
                      width: 15,
                    ),
              Container(
                width: 15,
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: !ResponsiveHelper.isMobile(context)
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
