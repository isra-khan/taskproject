class TaskModel {
  final String title;
  final String description;
  final DateTime fromDate;
  final DateTime toDate;
  final String priority;

  TaskModel({
    required this.title,
    required this.description,
    required this.fromDate,
    required this.toDate,
    required this.priority,
  });
}
