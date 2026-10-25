import 'package:flutter/material.dart';
import 'package:todo_app/constant/appcolors.dart';
import 'package:todo_app/model/taskmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TaskModel> listTask = [
    TaskModel(
      title: "Flutter Work",
      datetime: DateTime(2024, 11, 9),
      description: "Do it Now",
    ),
    TaskModel(
      title: "Math Work",
      datetime: DateTime(2024, 11, 9),
      description: "Do it Now",
    ),
    TaskModel(
      title: "Playing Cricket",
      datetime: DateTime(2024, 11, 9),
      description: "Do it Now",
    ),
  ];

  bool isTaskCompleted = false;

  @override
  Widget build(BuildContext context) {
    final sh1 = MediaQuery.of(context).size.height;
    final sw1 = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        title: const Text(
          "DSTP-ToDo",
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.bgColor,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listTask.length,
                itemBuilder: (context, index) {
                  var singleTask = listTask[index];
                  return Container(
                    margin: EdgeInsets.only(
                      top: sh1 * 0.03,
                      right: sw1 * 0.05,
                      left: sw1 * 0.05,
                      bottom: sh1 * 0.01,
                    ),
                    padding: EdgeInsets.only(
                      top: sh1 * 0.02,
                      bottom: sh1 * 0.02,
                      left: sw1 * 0.03,
                    ),
                    decoration: BoxDecoration(
                      color: singleTask.isChecked
                          ? AppColors.bgColor.withValues(alpha: 0.5)
                          : AppColors.bgColor.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.fabColor,
                          blurRadius: 3.0,
                          spreadRadius: singleTask.isChecked ? 1.0 : 3.0,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      border: Border.all(color: Colors.blue.shade100),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.appbarColor,
                          radius: 34,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              "assests/images/bike.jpg",
                            ),
                            backgroundColor: Colors.blueAccent,
                            radius: 30,
                          ),
                        ),
                        SizedBox(width: sw1 * 0.05),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                singleTask.title,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  decoration: singleTask.isChecked
                                      ? TextDecoration.lineThrough
                                      : null,
                                  decorationThickness: 4,
                                ),
                              ),
                              if (singleTask.description != null) ...[
                                Text(
                                  singleTask.description!,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                              Text(
                                "${singleTask.taskDate.day}/${singleTask.taskDate.month}/${singleTask.taskDate.year}",
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(width: sh1 * 0.05),
                        Spacer(),
                        Checkbox(
                          activeColor: Colors.greenAccent,
                          value: singleTask.isChecked,
                          onChanged: (isCheckedFlag) {
                            singleTask.isChecked = isCheckedFlag!;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.fabColor,
        onPressed: () {
          TextEditingController titleController = TextEditingController();
          TextEditingController descriptionController = TextEditingController();
          DateTime selectDate = DateTime.now();
          TimeOfDay selectTime = TimeOfDay.now();

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, showBottomState) {
                  return SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Add Todo",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.cancel),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: sh1 * 0.02,
                              left: sw1 * 0.07,
                              right: sw1 * 0.07,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.appbarColor,
                                  blurRadius: 6,
                                  spreadRadius: 0.4,
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: titleController,
                              textInputAction: TextInputAction.next,
                              onTap: () {
                                setState(() {});
                              },
                              onEditingComplete: () {},
                              enableSuggestions: true,
                              style: const TextStyle(
                                color: AppColors.secondaryText,
                              ),
                              decoration: InputDecoration(
                                fillColor: AppColors.inputFieldBgColor,
                                filled: true,
                                labelText: 'Title',
                                hintStyle: const TextStyle(
                                  color: AppColors.secondaryText,
                                ),
                                prefixIconColor: AppColors.inputHintTextColor,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: AppColors.taskCardBorderColor,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: AppColors.taskCardBorderColor,
                                    width: 2.0,
                                  ),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: sh1 * 0.03,
                              left: sw1 * 0.07,
                              right: sw1 * 0.07,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.appbarColor,
                                  blurRadius: 6,
                                  spreadRadius: 0.4,
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: descriptionController,
                              textInputAction: TextInputAction.done,
                              maxLines: 3,
                              onTap: () {
                                setState(() {});
                              },
                              onEditingComplete: () {},
                              enableSuggestions: true,
                              style: const TextStyle(
                                color: AppColors.secondaryText,
                              ),
                              decoration: InputDecoration(
                                fillColor: AppColors.inputFieldBgColor,
                                filled: true,
                                labelText: 'Description',
                                alignLabelWithHint: true,
                                hintStyle: const TextStyle(
                                  color: AppColors.secondaryText,
                                ),
                                prefixIconColor: AppColors.inputHintTextColor,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: AppColors.taskCardBorderColor,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: AppColors.taskCardBorderColor,
                                    width: 2.0,
                                  ),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(height: sh1 * 0.03),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: () async {
                                      DateTime? tumhareselectedDate =
                                          await showDatePicker(
                                            context: context,
                                            firstDate: DateTime(200),
                                            lastDate: DateTime(3000),
                                            initialDate: DateTime.now(),
                                          );
                                      if (tumhareselectedDate != null) {
                                        selectDate = tumhareselectedDate;
                                      }
                                      showBottomState(() {});
                                    },
                                    label: Text(
                                      // 2026/10/24
                                      "${selectDate.year}/${selectDate.month}/${selectDate.day}",
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: () async {
                                      TimeOfDay? tempTime =
                                          await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                          );
                                      if (tempTime != null) {
                                        selectTime = tempTime;
                                      }
                                      showBottomState(() {});
                                    },
                                    label: Text(
                                      "${selectTime.hour}:${selectTime.minute}",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: sh1 * 0.03),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: sw1 * 0.07,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  String title = titleController.text;
                                  String description =
                                      descriptionController.text;
                                  if (title.isNotEmpty) {
                                    listTask.add(
                                      TaskModel(
                                        title: title,
                                        description: description.isNotEmpty
                                            ? description
                                            : null,

                                        datetime: DateTime(
                                          selectDate.year,
                                          selectDate.month,
                                          selectDate.day,
                                          selectTime.hour,
                                          selectTime.minute,
                                        ),
                                      ),
                                    );
                                    Navigator.pop(context);
                                  }
                                  setState(() {});
                                },
                                child: const Text("Add"),
                              ),
                            ),
                          ),
                          SizedBox(height: sh1 * 0.03),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        child: Icon(Icons.add, color: AppColors.primaryText),
      ),
    );
  }
}
