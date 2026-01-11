import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class  DbHelper{

  DbHelper._();

  static final DbHelper getinstance=DbHelper._();

  static final String Table_Note="Note";
  static final String Table_Colum_SEno="SEno";
  static final String Table_Colum_Title="Title";
  static final String Table_Colum_Description="Description";
  static final String Table_Colum_Date="DueDate";
  static final String Table_Colum_Checked="Checked";




  /// Global Variables
  Database? myDb;

  /// Table Note



  /// Now Create OpenDb function

   Future<Database> getDB ()async{

     if(myDb!=null){
       return myDb!;
     }else {
        myDb=await openDB();
        return myDb!;

     }


   }


   Future<Database> openDB()async{

    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbpath=join(appDirectory.path,"TodoApp");
    return await openDatabase(dbpath,onCreate:(db,version){
      db.execute("create table $Table_Note($Table_Colum_SEno INTEGER PRIMARY KEY AUTOINCREMENT,$Table_Colum_Title TEXT,$Table_Colum_Description TEXT,$Table_Colum_Date TEXT,$Table_Colum_Checked INTEGER) "
      );


    } ,version: 1);

   }

   /// All queries

  /// Create Query
  Future<bool>addnote({required String title,required String description,required String date,required int Checked})async{

    var db= await getDB();
       int roweffected= await db.insert(Table_Note, {

         Table_Colum_Title:title,
         Table_Colum_Description:description,
         Table_Colum_Date: date,
         Table_Colum_Checked:Checked,
       });
       return roweffected>0;
  }
  /// Read Query
  Future<List<Map<String,dynamic>>> readnote()async{

     var db= await getDB();
     List<Map<String,dynamic>> note=await db.query(Table_Note);
     return note;
  }

  /// Update Query
  Future<bool>updateNote({required int seNo,required String title,required String description,required String date,required int Checked})async{
     var db=await getDB();
     int rowseffected =await db.update(Table_Note, {
       Table_Colum_Title:title,
       Table_Colum_Description:description,
       Table_Colum_Date:date,
       Table_Colum_Checked:Checked,
     },
     where: "$Table_Colum_SEno=?",whereArgs: [seNo]
     );
     return rowseffected>0;

  }
  /// Delete Query
  Future<bool> deletenote({required int seNo})async{
    
     var db=await getDB();
     int rowseffected=await db.delete(Table_Note,where: "$Table_Colum_SEno=?",whereArgs: [seNo]);
     return rowseffected>0;
  }

}