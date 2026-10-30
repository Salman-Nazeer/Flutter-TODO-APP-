class TaskModel {
  String title = "";
  String? description;
  bool isChecked = false;
  DateTime? taskDate;

  TaskModel({
    required this.title,
    this.description,
    this.isChecked = false,
    DateTime? datetime,
  }) : taskDate = datetime ?? DateTime.now();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['description'] = description;
    data['isChecked'] = isChecked;
    data['datetime'] = taskDate.toString();
    return data;
  }

  TaskModel.fromMap(Map<String, dynamic> data) {
    title = data['title'];
    description = data['description'];
    isChecked = data['isChecked'];
    taskDate = DateTime.parse(data['datetime'] ?? DateTime.now().toString());
  }
}
