import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskgameproject/screen/create_a_new_Task_screen.dart';
import 'package:taskgameproject/model/task_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskgameproject/screen/widgets/custom_info_card.dart';
import 'package:taskgameproject/screen/widgets/edit_task_screen.dart';
import 'package:taskgameproject/util/colorconstraint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskgameproject/screen/widgets/custom_calendar_card.dart';
import 'package:taskgameproject/screen/widgets/custom_info_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<TaskModel> taskList = [];
  final List<String> tabs = ["Today's Task", "Weekly Task", "Monthly Task"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  // 🔹 Filter helpers
  List<TaskModel> get highPriorityTasks =>
      taskList.where((task) => task.priority == "High").toList();
  // helper to strip time components
  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  List<TaskModel> get todayTasks {
    final today = _dateOnly(DateTime.now());
    return taskList.where((task) {
      final start = _dateOnly(task.fromDate);
      final end = _dateOnly(task.toDate);
      // ONLY tasks that both start AND end today
      return isSameDay(start, today) && isSameDay(end, today);
    }).toList();
  }

  List<TaskModel> get weeklyTasks {
    final today = _dateOnly(DateTime.now());
    final weekEnd = today.add(const Duration(days: 7)); // inclusive
    return taskList.where((task) {
      final start = _dateOnly(task.fromDate);
      final end = _dateOnly(task.toDate);

      // exclude exact single-day "today" tasks (they belong to todayTasks)
      if (isSameDay(start, today) && isSameDay(end, today)) return false;

      // include if end date is between today (inclusive) and weekEnd (inclusive)
      final endsOnOrAfterToday = !end.isBefore(today); // end >= today
      final endsOnOrBeforeWeekEnd = !end.isAfter(weekEnd); // end <= weekEnd
      return endsOnOrAfterToday && endsOnOrBeforeWeekEnd;
    }).toList();
  }

  List<TaskModel> get monthlyTasks {
    final today = _dateOnly(DateTime.now());
    final weekEnd = today.add(const Duration(days: 7));
    final nextMonthStart = DateTime(today.year, today.month + 1, 1);

    return taskList.where((task) {
      final start = _dateOnly(task.fromDate);
      final end = _dateOnly(task.toDate);

      // exclude exact single-day "today" tasks
      if (isSameDay(start, today) && isSameDay(end, today)) return false;

      // exclude weekly tasks (end <= weekEnd)
      if (!end.isAfter(weekEnd)) return false;

      // include tasks ending before next month starts
      return end.isBefore(nextMonthStart);
    }).toList();
  }

  bool isSameDay(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstraint.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Header ----------
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Notes',
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
            const SizedBox(height: 40),

            // ---------- High Priority ----------
            Text(
              'My Priority Tasks',
              style: TextStyle(
                color: ColorConstraint.textColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: highPriorityTasks.isNotEmpty
                  ? highPriorityTasks
                        .take(2)
                        .map(
                          (task) => CustomInfoCard(
                            icon: Icons.flag,
                            time:
                                DateFormat('d MMM').format(task.fromDate) ?? '',
                            title: task.title,
                            description: task.description,
                          ),
                        )
                        .toList()
                  : [
                      CustomInfoCard(
                        icon: Icons.flag,
                        time: '-',
                        title: 'No High Priority Task',
                        description: '',
                      ),
                    ],
            ),
            const SizedBox(height: 20),

            // ---------- My Tasks ----------
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
                  onTap: () async {
                    final newTask = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CreateANewScreen(),
                      ),
                    );

                    if (newTask != null && newTask is TaskModel) {
                      setState(() {
                        taskList.add(newTask);
                      });
                    }
                  },
                  child: Container(
                    width: 30,
                    height: 30,
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
                ),
              ],
            ),
            const SizedBox(height: 30),

            // ---------- Tabs ----------
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
                children: [
                  _buildTaskListView(todayTasks),
                  _buildTaskListView(weeklyTasks),
                  _buildTaskListView(monthlyTasks),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskListView(List<TaskModel> tasks) {
    if (tasks.isEmpty) {
      return const Center(child: Text("No tasks available"));
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final t = tasks[index];
        return GestureDetector(
          onTap: () async {
            final editedTask = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditANewScreen(task: t)),
            );

            if (editedTask != null) {
              //  setState(() {
              tasks[index] = editedTask; // update the task list
              //  });
            }
          },
          child: TaskCard(
            title: t.title,
            date:
                "${DateFormat('dd MMM yyyy').format(t.fromDate)} → ${DateFormat('dd MMM yyyy').format(t.toDate)}",
            status: t.priority,
          ),
        );
      },
    );
  }
}
