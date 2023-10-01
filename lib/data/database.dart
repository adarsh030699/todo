import 'package:hive_flutter/hive_flutter.dart';

class todoDatabase {
  //reference of the box

  final mybox = Hive.box('my box');

  List todoList = [];

  //  opens for the first time

  void createInitislData() {
    todoList = [
      ['cook food', false],
      ['drink water', false]
    ];
  }

  //  get data

  void loaddata() {
    todoList = mybox.get("TODOLIST");
  }

  //  update data

  void updateData() {
    mybox.put("TODOLIST", todoList);
  }
}
