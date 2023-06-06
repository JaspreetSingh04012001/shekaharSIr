import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/common/reusable%20widgets/rvenueLeakageCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:gap/gap.dart';

class Operation extends StatefulWidget {
  const Operation({Key? key}) : super(key: key);

  @override
  _OperationState createState() => _OperationState();
}

class _OperationState extends State<Operation> {
  var date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    "Operation",
                    style: Styles.poppins16w500,
                  ),
                  Expanded(child: Container()),
                  ElevatedButton(
                      onPressed: () async {
                        await showRoundedDatePicker(
                          height: 270,

                          theme: ThemeData(
                              // primaryColor: Colors.red,
                              primarySwatch: MaterialColor(
                            const Color.fromARGB(255, 255, 176, 170).value,
                            const <int, Color>{
                              50: Color.fromARGB(255, 255, 176, 170),
                              100: Color.fromARGB(255, 255, 176, 170),
                              200: Color.fromARGB(255, 255, 176, 170),
                              300: Color.fromARGB(255, 255, 176, 170),
                              400: Color.fromARGB(255, 255, 176, 170),
                              500: Color.fromARGB(255, 255, 176, 170),
                              600: Color.fromARGB(255, 255, 176, 170),
                              700: Color.fromARGB(255, 255, 176, 170),
                              800: Color.fromARGB(255, 255, 176, 170),
                              900: Color.fromARGB(255, 255, 176, 170),
                            },
                          )
                              // accentColor: Colors.blue,
                              // textColor: Colors.white,
                              // backgroundColor: Colors.blue,
                              // borderColor: Colors.white,
                              // iconColor: Colors.white,
                              //textTheme: TextTheme()
                              ),
                          // background: Colors.red,
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime(DateTime.now().year + 1),
                          borderRadius: 16,
                        ).then((value) {
                          setState(() {
                            if (value == null) {
                            } else {
                              date = value.toString();
                            }
                          });
                          //return null;
                        });
                      },
                      child: Text(date ?? "Select Date"))
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: const Offset(0, 1),
                          spreadRadius: 2,
                          blurRadius: 2)
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.stacked_bar_chart,
                            color: Styles.primaryColor,
                          ),
                          const Gap(10),
                          Text(
                            "Revenue Leakage",
                            style: Styles.poppins16w500,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RvenueLeakageCard(
                            circleAvatarWigdet: const Icon(
                              Icons.receipt,
                              size: 13,
                            ),
                            circleAvatarcolour: Colors.blueAccent,
                            subtitle: 'Bills Modified',
                            title: '0',
                          ),
                          const Gap(10),
                          RvenueLeakageCard(
                            circleAvatarWigdet: const Icon(
                              Icons.receipt_long,
                              size: 13,
                            ),
                            circleAvatarcolour: Colors.black,
                            subtitle: 'Bills Re-Printed',
                            title: '0',
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RvenueLeakageCard(
                            circleAvatarWigdet: const Icon(
                              Icons.card_membership,
                              size: 13,
                            ),
                            circleAvatarcolour: Colors.redAccent,
                            subtitle: 'Waived Off',
                            title: '₹ -0',
                          ),
                          const Gap(10),
                          RvenueLeakageCard(
                            circleAvatarWigdet: const Icon(
                              Icons.receipt,
                              size: 13,
                            ),
                            circleAvatarcolour: Colors.blueAccent,
                            subtitle: 'Cancelled KOTs',
                            title: '0',
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RvenueLeakageCard(
                            circleAvatarWigdet: const Icon(
                              Icons.menu_book_rounded,
                              size: 13,
                            ),
                            circleAvatarcolour: Colors.amber,
                            subtitle: 'Modified KOTs',
                            title: '0',
                          ),
                          const Gap(10),
                          RvenueLeakageCard(
                            circleAvatarWigdet: const Icon(
                              Icons.note_add_sharp,
                              size: 13,
                            ),
                            circleAvatarcolour: Colors.blueAccent,
                            subtitle: 'Not used in bills',
                            title: '0 KOTs',
                          )
                        ],
                      ),
                    ),
                    const Gap(10)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
