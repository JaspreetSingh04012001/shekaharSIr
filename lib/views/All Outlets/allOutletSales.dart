import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/common/reusable%20widgets/allOutletSalesTiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class AllOutletSales extends StatefulWidget {
  const AllOutletSales({Key? key}) : super(key: key);

  @override
  State<AllOutletSales> createState() => _AllOutletSalesState();
}

class _AllOutletSalesState extends State<AllOutletSales>
    with TickerProviderStateMixin {
  TabController? controller;
  double? avatarSize = 12;
  var date;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            //   FloatingActionButton.extended(
            //       extendedPadding: EdgeInsets.zero,
            //       onPressed: () {},
            //       label: Text(
            //         "Select Date",
            //         style: Styles.poppins16w400,
            //       )),

            // ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: Styles.myShadow),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "DashBoard",
                            style: Styles.poppins12,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
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
                              final DateFormat formatter =
                                  DateFormat('dd-MM-yyyy');
                              setState(() {
                                if (value == null) {
                                  date = "Select date";
                                } else {
                                  //value.day.toString();

                                  date = formatter.format(value);
                                }
                              });
                              return null;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade100,
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: const Offset(1, 3))
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  date == null ? "Select Date" : "$date",
                                  style: Styles.poppins12,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(15),
                  Container(
                    height: 110,
                    width: width,
                    decoration: BoxDecoration(
                      boxShadow: Styles.myShadow,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.amber,
                    ),
                    child: Row(
                        children: [
                      Flexible(
                        child: Container(
                         // color :Colors.blue,
                        //  width: width - 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                            ),
                            child: Center(
                              child: Container(
                            alignment: Alignment.center,
                            //color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Total Sales",
                                  style: Styles.poppins14.copyWith(
                                      color: const Color.fromARGB(
                                          255, 0, 109, 4),
                                      fontWeight: FontWeight.w400),
                                ),
                                // const Gap(5),
                                Text(
                                  "31,500.00",
                                  style: Styles.poppins16w500,
                                ),
                                // const Gap(5),
                                Text(
                                  "of 2 Outlets",
                                  style: Styles.poppins12
                                      .copyWith(color: Colors.grey),
                                ),
                                // const Gap(10),
                              ],
                            ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.info,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                                Text(
                                  " Total Sales of 91 orders",
                                  style: Styles.poppins12
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          )
                            ],
                          ),
                        ),
                      ),
                      Container(
                       // color : Colors.yellow,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                // foregroundColor: Colors.black45,
                                child: Icon(
                                  Icons.bar_chart_sharp,
                                  color: Color.fromRGBO(0, 81, 147, 1),
                                  size: 15,
                                ),
                              ),
                              CircleAvatar(
                                radius: 15,
                                // foregroundColor: Colors.black45,
                                child: Icon(
                                  Icons.more_vert,
                                  color: Color.fromRGBO(0, 81, 147, 1),
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: AllOutletSalesTiles(
                        tittle: "Online Sales",
                        circleAvatarChild: Icon(
                          Icons.sensors,
                          color: Colors.blue,
                          size: avatarSize,
                        ),
                        quantity: "0",
                        tittle2: '0% of Sales',
                      )),
                      const Gap(10),
                      // Expanded(child: AllOutletSalesTiles()),
                      Expanded(
                          child: AllOutletSalesTiles(
                        tittle: " Cash Collected",
                        circleAvatarChild: Icon(
                          Icons.payments,
                          color: Colors.green,
                          size: avatarSize,
                        ),
                        quantity: "212,22",
                        tittle2: '100% of offline sales',
                      )),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: AllOutletSalesTiles(
                        tittle: "Net Sales",
                        circleAvatarChild: Icon(
                          Icons.signal_cellular_alt,
                          color: Colors.amber,
                          size: avatarSize,
                        ),
                        quantity: "34,395.00",
                        tittle2: 'out of 2 outlets',
                      )),
                      const Gap(10),
                      // Expanded(child: AllOutletSalesTiles()),
                      Expanded(
                          child: AllOutletSalesTiles(
                        tittle: "Expenses",
                        circleAvatarChild: Icon(
                          Icons.account_balance_wallet,
                          color: Colors.indigo,
                          size: avatarSize,
                        ),
                        quantity: "0",
                        tittle2: 'Expenses Recieved',
                      )),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: AllOutletSalesTiles(
                        tittle: "Taxes",
                        circleAvatarChild: Icon(
                          Icons.receipt_long,
                          color: Colors.black,
                          size: avatarSize,
                        ),
                        quantity: "1569.88",
                        tittle2: 'Taxes Recovered',
                      )),
                      const Gap(10),
                      // Expanded(child: AllOutletSalesTiles()),
                      Expanded(
                          child: AllOutletSalesTiles(
                        tittle: "Discounts",
                        circleAvatarChild: Icon(
                          Icons.sell,
                          color: Styles.primaryColor,
                          size: avatarSize,
                        ),
                        quantity: "155.00",
                        tittle2: '0.45% of Discounts given',
                      )),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(10),
            SizedBox(
              width: width,
              height: 48.0, // Adjust the height as per your design
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                controller: controller,

                isScrollable: true, // Enable scrolling
                tabs: const [
                  Tab(text: 'Re-Printed'),
                  Tab(text: 'Waived Off'),
                  Tab(text: 'Rounded Off'),
                  Tab(text: 'Delivery Charge'),
                  Tab(text: 'Container Charge'),
                  // Add more tabs as needed
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: TabBarView(
                controller: controller,
                children: [
                  // Add your tab content here
                  Container(
                    color: Colors.red,
                    child: const Center(child: Text('Tab 1 Content')),
                  ),
                  Container(
                    color: Colors.green,
                    child: const Center(child: Text('Tab 2 Content')),
                  ),
                  Container(
                    color: Colors.blue,
                    child: const Center(child: Text('Tab 3 Content')),
                  ),
                  Container(
                    color: Colors.yellow,
                    child: const Center(child: Text('Tab 4 Content')),
                  ),
                  Container(
                    color: Colors.orange,
                    child: const Center(child: Text('Tab 5 Content')),
                  ),
                  // Add more tab content widgets as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
