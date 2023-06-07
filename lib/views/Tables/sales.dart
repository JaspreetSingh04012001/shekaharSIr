import 'package:admin/common/reusable%20widgets/salesTiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../common/app_styles_colors.dart';

class Sales extends StatefulWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  var date;
  Map tile = {0: {}};
  // List<_SalesData> data = [
  //   _SalesData('Jan', 35),
  //   _SalesData('Feb', 28),
  //   _SalesData('Mar', 34),
  //   _SalesData('Apr', 32),
  //   _SalesData('May', 40)
  // ];
  List<_PieData> pieData = [
    _PieData('Jan', 100, 'xsx 100'),
    _PieData('Feb', 120, 'y'),
    _PieData('Mar', 79, 'y'),
    _PieData('Apr', 90, 'y  '),
    _PieData('May', 200, 'z')
  ];
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14),
      _ChartData('aa', 6.4),
      _ChartData('ss', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 30,
                  //   color: Colors.grey,
                  // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                                  decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                      color: Colors.white, boxShadow: Styles.myShadow),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Sales",
                        style: Styles.poppins18w600,
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
                          final DateFormat formatter = DateFormat('dd-MM-yyyy');
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
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade100,
                                    spreadRadius: 3,
                                    blurRadius: 3,offset: Offset(1, 3))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              date == null ? "Select Date" : "$date",
                              style: Styles.poppins16w400,
                            ),
                          ),
                        ),
                      ),
                                      )
                                    ],
                                  ),
                                ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "₹ 2,000",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 26, 35, 126),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " / ",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "15 Orders",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 58, 189, 69),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                 
                  SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum: 50,
                        interval: 10,
                      ),
                      tooltipBehavior: _tooltip,
                      series: <ChartSeries<_ChartData, String>>[
                        ColumnSeries<_ChartData, String>(
                          //spacing: 0,
                          dataSource: data,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          name: 'Gold',
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),

                          gradient: const LinearGradient(colors: [
                            Color(0xffe65857),

                            Color.fromARGB(255, 211, 75, 75),
                            // Color(0xff761d31),
                            Color.fromARGB(255, 139, 40, 62)
                          ]),
                          // color: const Color.fromRGBO(8, 142, 255, 1))
                        )
                      ]),
                  SalesTiles(
                    amount: '7,038',
                    circleAvatarChild: const Icon(
                      size: 20,
                      Icons.restaurant_rounded,
                      color: Colors.red,
                    ),
                    orders: '26',
                    tittle: "Dine in",
                  ),
                  SalesTiles(
                    amount: '3,855',
                    circleAvatarChild: const Icon(
                      size: 20,
                      Icons.local_mall_outlined,
                      color: Color.fromARGB(255, 224, 202, 3),
                    ),
                    orders: '12',
                    tittle: "Pick up",
                  ),
                  SalesTiles(
                    amount: '3,230',
                    circleAvatarChild: const Icon(
                      Icons.two_wheeler_rounded,
                      size: 20,
                      color: Color.fromARGB(255, 39, 105, 41),
                    ),
                    orders: '12',
                    tittle: "Delivery",
                  ),
                  SfCircularChart(
                      title: ChartTitle(text: 'Yo its your boy jass'),
                      legend: Legend(isVisible: true),
                      series: <DoughnutSeries<_PieData, String>>[
                        DoughnutSeries<_PieData, String>(
                            explode: true,
                            explodeIndex: 0,
                            dataSource: pieData,
                            xValueMapper: (_PieData data, _) => data.xData,
                            yValueMapper: (_PieData data, _) => data.yData,
                            dataLabelMapper: (_PieData data, _) => data.text,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true)),
                      ])

                  // Center(
                  //   child: SizedBox(
                  //     width: 300,
                  //     height: 300,
                  //     child: Echarts(
                  //       reloadAfterInit: true,

                  //       theme: "red",
                  //       option: '''
                  //     {
                  //   xAxis: {
                  //     type: 'category',
                  //     data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                  //   },
                  //   yAxis: {
                  //     type: 'value'
                  //   },
                  //   series: [{
                  //     data: [820, 932, 901, 934, 1290, 1330, 1320],
                  //     type: 'bar'
                  //   }]
                  //     }
                  //   ''',
                  //     ),
                  //   ),
                  // )
                  //Initialize the chart widget
                  // SfSparkBarChart(
                  //   data: data,

                  //     // primaryXAxis: CategoryAxis(),
                  //     // // Chart title
                  //     // title: ChartTitle(text: 'Half yearly sales analysis'),
                  //     // // Enable legend
                  //     // legend: Legend(isVisible: true),
                  //     // // Enable tooltip
                  //     // tooltipBehavior: TooltipBehavior(enable: true),
                  //     // series: <ChartSeries<_SalesData, String>>[
                  //     //   LineSeries<_SalesData, String>(
                  //     //       dataSource: data,
                  //     //       xValueMapper: (_SalesData sales, _) => sales.year,
                  //     //       yValueMapper: (_SalesData sales, _) => sales.sales,
                  //     //       name: 'Sales',
                  //     //       // Enable data label
                  //     //       dataLabelSettings: const DataLabelSettings(isVisible: true))
                  //     //]
                  //     ),
                ]),
          ),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
