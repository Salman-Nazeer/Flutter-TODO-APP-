class TaskModel {
  String title = "";
  String? description;
  bool isChecked = false;

  // DateTime taskDate = DateTime.now();
  DateTime taskDate;

  TaskModel({
    required this.title,
    this.description,
    this.isChecked = false,
    DateTime? datetime,
  }) :taskDate = datetime ?? DateTime.now();

}