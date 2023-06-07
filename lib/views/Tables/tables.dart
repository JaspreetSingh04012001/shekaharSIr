import 'package:admin/views/Tables/perpairingFoodTable.dart';
import 'package:admin/views/Tables/vacantTables.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Tables extends StatefulWidget {
  const Tables({Key? key}) : super(key: key);

  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  VacantTables(
                    image: 'assets/1.jpg',
                    number: 1,
                    type: 'Normal',
                  ),
                  VacantTables(
                    image: 'assets/fastfood.png',
                    number: 2,
                    type: 'Fast Food',
                  ),
                  VacantTables(
                    image: 'assets/delivery.png',
                    number: 3,
                    type: 'Delivery',
                  ),
                  PerpairingFoodTable(
                    tittle: "Oder Preparing",
                    imageLink:
                        'https://assets2.lottiefiles.com/packages/lf20_vkqybeu5/data.json',
                    number: 4,
                    type: 'Normal',
                  ),
                  PerpairingFoodTable(
                    tittle: "Prepairing",
                    imageLink:
                        'https://assets8.lottiefiles.com/packages/lf20_s5tFhoBEWg.json',
                    number: 5,
                    type: 'Fast Food',
                  ),
                  PerpairingFoodTable(
                    tittle: "Delivering",
                    imageLink:
                        'https://assets3.lottiefiles.com/packages/lf20_s3apehpd.json',
                    number: 5,
                    type: 'Delivery',
                  ),
                ],
              ),
            ),
            const Gap(20)
          ],
        ),
      ),
    );
  }
}
