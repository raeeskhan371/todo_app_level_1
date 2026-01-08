import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app_level_1/Screen/Add_Screen.dart';


class HomeScreen extends StatefulWidget {
  List<Map<String, dynamic>> Task=[];
  String?  title;
  String? description;
   String? dueDate;



  @override
  State<HomeScreen> createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen> {
  /// Toggler Button State
  bool isAllSelected=true;
  bool isCompletedSelected=true;
  /// Variables

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///AppBar Section
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Todo List",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 5,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
      ),
      /// Body Section
      body:

      /// parent Column
      Container(
        color: Colors.white,
        child: Column(
          children: [
            /// Child Column
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 8,right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// top Two texts
                  Text("Hi Raees.",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                  Text("Here are your tasks for today.",style: TextStyle(fontSize: 16),),
                  SizedBox(height: 20,),
                  /// Toggler Button Section
                  Container(height: 40,
                    width: 340,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2),blurRadius: 10)]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ///All Text Button
                        GestureDetector(onTap: (){

                          setState(() {
                            isAllSelected=true;
                          });
                        },
                          child: Container(
                            height: 40,
                            width:170 ,
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:isAllSelected? Colors.blue : Colors.white
                            ),
                            child: Center(child: Text("All",style: TextStyle(fontSize: 18,

                                color: isAllSelected ? Colors.white :Colors.grey),)),
                          ),
                        ),
                        /// Completed Text Button
                        GestureDetector(  onTap: (){
                          setState(() {
                            isAllSelected=false;
                          }
                          );
                        },
                          child: Container(
                            height: 40,
                            width:170 ,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:isAllSelected? Colors.white : Colors.blue
                            ),
                            child: Center(child: Text("Completed",style: TextStyle(fontSize: 18,color:!isAllSelected? Colors.white:Colors.grey.shade900),)),

                          ),
                        ),


                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  /// List TileTask Card
                  SizedBox(
                    child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                    elevation: 5,
                    child: ListTile(

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      tileColor: Colors.white,
                      leading: Stack(
                        children: [
                        GestureDetector( onTap: (){

                          setState(() {
                            isCompletedSelected=!isCompletedSelected;
                            print("Unselected");
                          });
                        },
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color:isCompletedSelected? Colors.transparent : Colors.blue,
                              border: BoxBorder.all(color: Colors.blue,width: 1)
                            ),
                            child: Icon(Icons.check,color:isCompletedSelected? Colors.transparent:Colors.white,size: 20,),

                          ),
                        ),

                        ],
                        ///END of Stack
                      ),
                      title: Expanded(child: Text(widget.title??"No Title",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Edit and Delete Task
                          Row(

                            children: [
                              Expanded(child: Text(widget.description??"No Description",style: TextStyle(fontSize: 14,color: Colors.black),)),SizedBox(width: 32,),
                              Icon(FontAwesomeIcons.penToSquare,color: Colors.indigo,size: 18,),
                              SizedBox(width: 20,),
                              Icon(FontAwesomeIcons.trash,color: Colors.red,size: 18,),
                            ],
                          ),
                          Container(width: 100,
                            height: 30,
                            child: Text(  widget.dueDate ?? "No Due Date",style: TextStyle(fontSize: 14,color: Colors.grey),),

                            ),

                        ],
                      ),

                    ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),


      /// Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        onPressed: ()async{
          final Map<String,dynamic>? result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTask()));
          if(result!=null){
            setState(() {
              widget.title=result["title"];
              widget.description=result["description"];
              widget.dueDate=result["dueDate"];
            });
          }
      },
      child: Icon(Icons.add,color: Colors.white),),
    );
  }
}
