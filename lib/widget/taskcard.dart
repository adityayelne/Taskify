import 'package:flutter/material.dart';
import '../constants/colours.dart';
import '../model/logicbaby.dart';

class Taskcard extends StatelessWidget{



  final ToDo todo ;
  final onChanged;
  final onDelete;

  const Taskcard(
    {Key?key,required this.todo,required this.onChanged,required this.onDelete}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap:() {


          onChanged(todo);
          
        },







        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),




        tileColor: Color.fromARGB(255, 88, 88, 88),
        leading: Icon(todo.isCompleted? Icons.check_box:Icons.check_box_outline_blank,color: white,),
        title: Text(
          todo.taskText!,style: TextStyle(fontSize: 16,color: white,
          decoration: todo.isCompleted? TextDecoration.lineThrough:null,),),
        trailing: Container(
          height: 35, width: 35, decoration: BoxDecoration(
            color: lgrey,
            borderRadius: BorderRadius.circular(2)

          ),
          child: IconButton(
            color: Colors.redAccent, iconSize: 18, icon: Icon(Icons.delete),
            onPressed: () {
              onDelete(todo.id);
            },

          ),
        ),
      )
    );
  }
}
