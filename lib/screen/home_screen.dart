import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskgameproject/screen/widgets/custom_info_card.dart';
import 'package:taskgameproject/util/colorconstraint.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskgameproject/screen/widgets/custom_calendar_card.dart';
import 'package:taskgameproject/screen/widgets/custom_info_card.dart';
import 'package:taskgameproject/util/colorconstraint.dart';
import 'package:taskgameproject/util/routes/approutes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> tabs = ["Today's Task", "Weekly Task", "Monthly Task"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstraint.primaryColor,
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
                  width: 30,
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                    color: ColorConstraint.greenColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    color: ColorConstraint.whiteTextColor,
                    size: 28,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // ---------- My Tasks Header ----------
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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.createNewTask);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorConstraint.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/add.svg',
                      color: Colors.white,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                controller: _tabController,
                tabs: tabs.map((e) => Tab(text: e)).toList(),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                labelColor: ColorConstraint.textColor,
                unselectedLabelColor: ColorConstraint.textColor,
                labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                dividerColor: Colors.transparent,
              ),
            ),

            const SizedBox(height: 10),

            // ---------- TabBar Views ----------
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  TaskCard(
                    title: "Prepare Presentation",
                    date: "14 October 2025",
                    status: "In Progress",
                  ),
                  TaskCard(
                    title: "Update Notes",
                    date: "15 October 2025",
                    status: "To do",
                  ),
                  TaskCard(
                    title: "Update Notes",
                    date: "15 October 2025",
                    status: "To do",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
