import 'package:flutter/material.dart';
import 'package:todo_app_level_1/Data/LocalData/db_helper_sqfLite.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

  /// Singlton
  late DbHelper dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = DbHelper.getinstance;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        /// AppBar Section
        appBar: AppBar(
          centerTitle: true,
          elevation: 5,
          title: Text(
            "Add New Task",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {

              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),

        /// Body Section
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 100),
              width: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: Offset(3, 3),
                  ),
                ],
              ),

              /// TextFields Column
              /// /// TextFields
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 50,
                  top: 50,
                  left: 20,
                  right: 20,
                ),
                child: Column(mainAxisSize: MainAxisSize.min,
                  children: [
                    /// TextField Title
                    TextFormField(
                      controller: titleController,

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.title, color: Colors.grey),
                        labelText: "Title",
                        hintText: "Enter Title",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade500,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                          ),
                        ),
                      ),
                    ),

                    /// TextField Description
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: descriptionController,
                      maxLines: 2,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 30),
                        prefixIcon: Icon(
                          Icons.description_outlined,
                          color: Colors.grey,
                        ),
                        // labelText: "Description",
                        hintText: "Enter Task Details...",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade500,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// DueDate Field
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: dueDateController,
                      readOnly: false,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),

                        hintText: "Due Date",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade500,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    /// Add Task Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 105,
                          vertical: 10,
                        ),
                        backgroundColor: Colors.indigoAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        String title = titleController.text.trim();
                        String description = descriptionController.text
                            .trim();
                        String date = dueDateController.text.trim();
                        int Checked = 0;
                        if (title.isEmpty ||
                            description.isEmpty ||
                            date.isEmpty) {
                          return;
                        }
                        bool result = await dbRef.addnote(
                          title: title,
                          description: description,
                          date: date,
                          Checked: Checked,
                        );
                        if (result) {

                          Navigator.pop(context, true);


                        }
                      },
                      child: Text(
                        "Add Task",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
