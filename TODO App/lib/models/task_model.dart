
class TaskModel {
  int iconCodePoint, iconColor, conColor;
  String taskTitle;
  String? date, time, notes;
  bool isComplete;
  DateTime? createdAt;
  TaskModel(
      {required this.taskTitle,
      required this.iconCodePoint,
      required this.iconColor,
      required this.conColor,
      this.notes,
      this.date,
      this.time,
      this.createdAt,
      required this.isComplete});

  factory TaskModel.fromjson(json) {
    return TaskModel(
        taskTitle: json["taskTitle"],
        iconCodePoint: json["iconCodePoint"],
        iconColor: json["iconColor"],
        conColor: json["conColor"],
        isComplete: json["isComplete"],
        date: json["date"],
        time: json["time"],
        notes: json["notes"]);
  }
}
