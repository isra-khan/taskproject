import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskgameproject/screen/widgets/custom_calendar_card.dart';
import 'package:taskgameproject/screen/widgets/custom_info_card.dart';
import 'package:taskgameproject/util/colorconstraint.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Weclome to Notes',
                  style: TextStyle(
                    color: ColorConstraint.textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Have a great Day',
                  style: TextStyle(
                    color: ColorConstraint.textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'My Priority Tasks',
              style: TextStyle(
                color: ColorConstraint.textColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInfoCard(
                  icon: Icons.phone,
                  time: '2:10',
                  title: 'Welecome to Notes',
                  description: 'Have a great Day',
                ),
                CustomInfoCard(
                  icon: Icons.phone,
                  time: '2:10',
                  title: 'Welecome to Notes',
                  description: 'Have a great Day',
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Tasks',
                  style: TextStyle(
                    color: ColorConstraint.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorConstraint.primaryColor,
                  ),
                  child: SvgPicture.asset('assets/images/add.svg'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today's Task"),

                Text('Weekly Task'),
                Text('Monthly Task'),
              ],
            ),
            Column(
              children: const [
                TaskCard(
                  title: "Complete Assignment #2",
                  date: "10 October 2025",
                  status: "To do",
                ),
                TaskCard(
                  title: "Submit Fee Challan",
                  date: "9 October 2025",
                  status: "Done",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
