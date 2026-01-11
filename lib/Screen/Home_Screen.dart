import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app_level_1/Screen/Add_Screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> Tasks = [];

  /// Toggler Button State
  bool isAllSelected = true;
  bool isCompletedSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar Section
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          "Todo List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 5,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),

      /// Body Section
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Texts
              Text(
                "Hi Raees.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              Text(
                "Here are your tasks for today.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              /// Toggler Button Section
              Container(
                height: 40,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// All Text Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAllSelected = true;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isAllSelected ? Colors.blue : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "All",
                            style: TextStyle(
                              fontSize: 18,
                              color: isAllSelected ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Completed Text Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAllSelected = false;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isAllSelected ? Colors.white : Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            "Completed",
                            style: TextStyle(
                              fontSize: 18,
                              color: !isAllSelected
                                  ? Colors.white
                                  : Colors.grey.shade900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              /// List TileTask Card
              Flexible(
                child: ListView.builder(
                  itemCount: Tasks.length,
                  itemBuilder: (context, index) {
                    final task = Tasks[index];

                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: Colors.white,
                        leading: GestureDetector(
                          onTap: () {
                            setState(() {
                              isCompletedSelected = !isCompletedSelected;
                            });
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: isCompletedSelected
                                  ? Colors.transparent
                                  : Colors.blue,
                              border: BoxBorder.all(color: Colors.blue, width: 1),
                            ),
                            child: Icon(
                              Icons.check,
                              color: isCompletedSelected
                                  ? Colors.transparent
                                  : Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        title: Text(
                          task["title"] ?? "No Title",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Edit and Delete Row
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    task["description"] ?? "No Description",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                                SizedBox(width: 32),
                                GestureDetector(
                                  onTap: (){

                                  },

                                  child: GestureDetector( onTap: (){
                                     showModalBottomSheet(context: context, builder:(context) {
                                       return Container(
                                         width: double.infinity,
                                         child: Padding(
                                           padding: const EdgeInsets.only(left: 20,right: 20,),
                                           child: SingleChildScrollView(
                                             child: Container(
                                               child: Column(
                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                   SizedBox(height: 20,),
                                                   /// Update Task Text
                                                   Text("Update Task",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                                   SizedBox(height: 10,),
                                                   /// TextField Title
                                                   TextFormField(
                                                       decoration: InputDecoration(
                                                         prefixIcon: Icon(Icons.title,color: Colors.grey,),
                                                         labelText: "Title",
                                                         hintText: "Enter Title",
                                                         enabledBorder: OutlineInputBorder(
                                                             borderRadius: BorderRadius.circular(10),
                                                             borderSide: BorderSide(color:Colors.grey.shade500,width: 1)
                                                         ),
                                                         focusedBorder: OutlineInputBorder(
                                                             borderRadius: BorderRadius.circular(15),
                                                             borderSide: BorderSide(color:Colors.blue,width: 1)
                                                         ),
                                                       )
                                                   ),
                                                   /// TextField Description
                                                   const SizedBox(height:20,),
                                                   TextFormField(
                                                       maxLines: 2,
                                                       textAlignVertical: TextAlignVertical.center,
                                                       decoration: InputDecoration(
                                                         contentPadding: EdgeInsets.only(top: 30),
                                                         prefixIcon: Icon(Icons.description_outlined,color: Colors.grey,),
                                                         labelText: "Description",
                                                         hintText: "Enter Task Details...",
                                                         enabledBorder: OutlineInputBorder(
                                                             borderRadius: BorderRadius.circular(10),
                                                             borderSide: BorderSide(color:Colors.grey.shade500,width: 1)
                                                         ),
                                                         focusedBorder: OutlineInputBorder(
                                                             borderRadius: BorderRadius.circular(15),
                                                             borderSide: BorderSide(color:Colors.blue,width: 1)
                                                         ),
                                                       )
                                                   ),
                                                   const SizedBox(height:20,),
                                                   /// DueDate Field
                                                   TextFormField(
                                                     keyboardType: TextInputType.number,
                                                       readOnly: false,
                                                       textAlignVertical: TextAlignVertical.center,
                                                       decoration: InputDecoration(
                                                         prefixIcon: Icon(Icons.calendar_month,color: Colors.grey,),
                                                         hintText: "Due Date",
                                                         enabledBorder: OutlineInputBorder(
                                                             borderRadius: BorderRadius.circular(5),
                                                             borderSide: BorderSide(color:Colors.grey.shade500,width: 1)
                                                         ),
                                                         focusedBorder: OutlineInputBorder(
                                                             borderRadius: BorderRadius.circular(5),
                                                             borderSide: BorderSide(color:Colors.blue,width: 1)
                                                         ),
                                                       )
                                                   ),
                                                   SizedBox(height: 20,),
                                                   /// Add Task Button
                                                   Row(
                                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                     children: [
                                                       ElevatedButton(
                                                         style: ElevatedButton.styleFrom(
                                                           fixedSize: Size(150, 10),
                                                           backgroundColor: Colors.indigoAccent,
                                                           foregroundColor: Colors.white,
                                                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                         ),
                                                         onPressed: (){

                                                           /// add function soon

                                                         },
                                                         child: Text("Update Task",style: TextStyle(fontSize: 18,),
                                                         ),
                                                       ),
                                                       /// Cancel Button
                                                       ElevatedButton(
                                                         style: ElevatedButton.styleFrom(
                                                           fixedSize: Size(150, 10),
                                                           backgroundColor: Colors.red,
                                                           foregroundColor: Colors.white,
                                                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                         ),
                                                         onPressed: (){
                                                           Navigator.of(context,rootNavigator: true).pop();
                                                         },
                                                         child: Text("Cancel",style: TextStyle(fontSize: 18,),
                                                         ),
                                                       ),
                                                     ],
                                                   )
                                               
                                                 ],
                                               ),
                                             ),
                                           ),
                                         ),

                                       );

                                     });
                                  },
                                    child: Icon(FontAwesomeIcons.penToSquare,
                                        color: Colors.indigo, size: 18),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Icon(FontAwesomeIcons.trash,
                                    color: Colors.red, size: 18),
                              ],
                            ),
                            Container(
                              width: 100,
                              height: 30,
                              child: Text(
                                task["dueDate"] ?? "No Due Date",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      /// Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        onPressed: () async {
          final Map<String, dynamic>? newtask = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTask()));
          if (newtask != null) {
            setState(() {
              Tasks.add(newtask);
            });
          }
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
