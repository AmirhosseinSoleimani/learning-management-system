class Task {
  String id;
  String title;
  String note;
  bool isCompleted;
  String date;
  String startTime;
  String color;
  String endTime;
  int remind;
  Task(
      {required this.id,
      required this.endTime,
      required this.title,
      required this.note,
      required this.color,
      required this.date,
      this.isCompleted = false,
      required this.remind,
      required this.startTime});
}
