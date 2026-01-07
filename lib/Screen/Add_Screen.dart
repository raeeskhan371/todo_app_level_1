import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /// AppBar Section
        appBar: AppBar(centerTitle: true,
          elevation: 5,
          title: Text("Add New Task",style: TextStyle(fontWeight: FontWeight.bold),),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),

        /// Body Section
        body:Center(
          child: Container(
            width: double.infinity  ,
          height: double.infinity,
          color: Colors.white,
          /// Parent  MainColumn
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
          width: 330,
          height: 400,
          decoration: BoxDecoration(
          color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1 ),blurRadius: 10,spreadRadius: 10,offset: Offset(3, 3))]
              ),
                /// TextFields Column
                /// /// TextFields
                child: Padding(
                  padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
                  child: Column(
                    children: [
                      /// TextField Title
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.title,color: Colors.grey,),
                            labelText: "Title",
                            hintText: "Enter Title",
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
                      /// TextField Description
                      const SizedBox(height:20,),
                      TextFormField(
                        maxLines: 2,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(

                            contentPadding: EdgeInsets.only(top: 30),
                            prefixIcon: Icon(Icons.description_outlined,color: Colors.grey,),
                            // labelText: "Description",
                            hintText: "Enter Task Details...",
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
                      const SizedBox(height:20,),
                      /// TimePicker Field
                      TextFormField(
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
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 105,vertical: 10),
                            backgroundColor: Colors.indigoAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                          ),
                          onPressed: (){

                      }, child: Text("Add Task",style: TextStyle(fontSize: 18,),
                      ),)

                    ],
                  ),
                ),
              ),
              ],
          ),
          )
          ),
      ),
    );
  }
}
