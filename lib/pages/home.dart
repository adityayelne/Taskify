// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/logicbaby.dart';
import '../constants/colours.dart';
import '../widget/taskcard.dart'; 

class Home extends StatefulWidget{
  Home({Key? key}): super(key:key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final taskList = ToDo.taskList();

  final _taskcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: _buildAppBar(),
      body: Stack(
        children:[
         Container( 
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15
          ),
          
          child: Column(
          children: [
            searchBox(),
            Container(
              
                    margin: EdgeInsets.only(top: 12,bottom:08,),
                    child: Text('Discover',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: lgrey),)

                  ),
                  
                  _buildHorizontalScrollView(),
                  Expanded(
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10,bottom:20,),
                            child: Text('Scheduled',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,color: white),),
                          ),
        
        
                          for(ToDo todo in taskList)
                            Taskcard(todo: todo,
                            onChanged: _handleChange,
                            onDelete: _deleteTask,
                            ),
        
                        ],
                     ),
            
                    )
                    
              ], 
            ),
          ),
          Align(alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(child:
              Container(margin: EdgeInsets.only(
                bottom: 5,
                right: 20,
                left: 20
                ),

                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 34, 32, 32),
                boxShadow: const [BoxShadow(
                  color: Color.fromARGB(255, 30, 30, 30),offset: Offset(0.0, 0.0),
                  blurRadius: 8.0,
                  spreadRadius: 0.0,
                ),
                ],
                borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _taskcController,
                  decoration: InputDecoration(
                    hintText: 'Add a new Task...',
                    hintStyle: TextStyle(color: white),
                    border: InputBorder.none,
                  ),
                ),
              )
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5,right: 20,),
                child: ElevatedButton( child: Text('+',style: TextStyle(fontSize: 32,color: white),),


                onPressed: () {
                  _addTask(_taskcController.text);
                },
                style: ElevatedButton.styleFrom(backgroundColor: grey,minimumSize: Size(60,60, ),
                elevation: 20,)
                
                
                  ),
                ),
              
              ],),
          ),
        ],
      ),
    );
  }



void _handleChange(ToDo todo) {
  setState(() {
    todo.isCompleted = !todo.isCompleted;
    
  });
  
}

void _deleteTask(String id){
  setState(() {
    taskList.removeWhere((item) => item.id == id );
  });
  
}


void _addTask(String todo){
  setState(() {
    taskList.add(
      ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(),
     taskText: todo,
  ));
    
  });
  _taskcController.clear();
}

















  AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 27, 28, 28),
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.menu,
          color: white,
          size: 30,
        ),
        Expanded(
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min, // Ensures the text row takes only necessary space
              children: [
                const Text(
                  'TASKIFY',
                  style: TextStyle(
                    color: red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8), // Space between "TASKIFY" and "POCKET LIST"
                const Text(
                  'POCKET LIST',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10, // Use 8 or 10 as needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset('assets/me.jpg'),
          ),
        ),
      ],
    ),
  );
}
}

// ignore: camel_case_types
class searchBox extends StatelessWidget {
  const searchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: lgrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: white
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: white),
          
        ),
      ),
    );
  }
}
Widget _buildHorizontalScrollView() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(5, (index) => _buildImage(index)),
    ),
  );
}
Widget _buildImage(int index) {
  List<String> imagePaths = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
  ];

  return Container(
    padding: EdgeInsets.symmetric(vertical: 4),
    margin: EdgeInsets.only(right: 10), // Spacing between images
    width: 300,
    height: 175,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        imagePaths[index],
        fit: BoxFit.cover,
      ),
    ),
  );
}