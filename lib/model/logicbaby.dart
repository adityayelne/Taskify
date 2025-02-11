

class ToDo{
  String? id;
  String? taskText;
  bool isCompleted;



  ToDo({
    required this.id,
    required this.taskText,
    this.isCompleted=false

  });

  static List<ToDo> taskList(){
    return[
      //ToDo(id: '1',taskText: 'Learn Webdev',isCompleted: true),
      //ToDo(id: '2',taskText: 'Learn appdev',isCompleted: false),
      //ToDo(id: '3',taskText: 'Practice DSA',isCompleted: false),
      //ToDo(id: '4',taskText: 'Hit the Gym',isCompleted: false),
      //ToDo(id: '5',taskText: 'Complete Assignments',isCompleted: false),
      //ToDo(id: '6',taskText: 'Play Games',isCompleted: false),

    ];
  }


}