import 'package:flutter/material.dart';

import '../app_styles_colors.dart';

class RvenueLeakageCard extends StatelessWidget {
  String title;
  String subtitle;
  Color? circleAvatarcolour;
  Widget circleAvatarWigdet;
  RvenueLeakageCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.circleAvatarcolour,
      required this.circleAvatarWigdet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      width: MediaQuery.of(context).size.width * 0.44,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        title: Row(
          children: [
            Text(
              title,
              style: Styles.poppins16w500,
            ),
          ],
        ),
        isThreeLine: true,
        subtitle: Padding(
          padding: const EdgeInsets.only(
            top: 5,
          ),
          child: Text(
            subtitle,
            style:
                Styles.poppins16w500.copyWith(fontSize: 14, color: Colors.grey),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: circleAvatarcolour,
            radius: 11,
            child: circleAvatarWigdet,
          ),
        ),
      ),
    );
  }
}
