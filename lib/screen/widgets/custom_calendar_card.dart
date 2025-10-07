import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;

  const TaskCard({
    super.key,
    required this.title,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    bool isDone = status.toLowerCase() == "done";

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.shade100.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, size: 20, color: Colors.black54),
          const SizedBox(width: 8),

          // Title and date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),

          // Flag icon
          Icon(Icons.flag, color: isDone ? Colors.green : Colors.red, size: 20),
          const SizedBox(width: 8),

          // Status Chip
          Container(
            decoration: BoxDecoration(
              color: isDone
                  ? Colors.greenAccent.shade100
                  : Colors.blueGrey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              status,
              style: TextStyle(
                color: isDone
                    ? Colors.green.shade800
                    : Colors.blueGrey.shade800,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Menu icon
          const Icon(Icons.more_vert, color: Colors.black54),
        ],
      ),
    );
  }
}
