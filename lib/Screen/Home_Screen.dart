import 'package:flutter/material.dart';
import 'package:todo_app_level_1/Screen/Add_Screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Toggler Button State
  bool isAllSelected=true;
  
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
              padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// top Two texts
                  Text("Hi Raees.",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                  Text("Here are your tasks for today.",style: TextStyle(fontSize: 16),),
                  SizedBox(height: 20,),
                  /// Toggler Button Section
                  Container(height: 40,
                    width: 320,

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
                            width:160 ,
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
                            width:160 ,
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
                  /// Task Card
                  Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                  elevation: 5,
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    tileColor: Colors.white,
                    leading: Icon(Icons.check_box,color: Colors.blue,),
                    title: Text("Task 1"),
                    subtitle: Text("Description"),
                    trailing: Icon(Icons.more_vert),
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
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTask()));
      },
      child: Icon(Icons.add,color: Colors.white),),
    );
  }
}
