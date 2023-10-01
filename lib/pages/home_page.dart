import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/utils/dialog_box.dart';

import '../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    //  for this first time open

    if (_mybox.get("TODOLIST") == null) {
      db.createInitislData();
    } else {
      db.loaddata();
    }

    super.initState();
  }

  // reference

  final _mybox = Hive.box('my box');

  todoDatabase db = todoDatabase();

  void deletetask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  void onsave() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      Navigator.pop(context);
      _controller.text = "";
    });
    db.updateData();
  }

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void creatingWidow() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            oncancel: () {
              Navigator.of(context).pop();
            },
            onsave: onsave,
          );
        });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "To Do APP",
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: creatingWidow,
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
      backgroundColor: Color.fromARGB(255, 254, 246, 178),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskCompleted: db.todoList[index][1],
            taskName: db.todoList[index][0],
            onchanged: (value) => checkboxchanged(value, index),
            deletetask: (BuildContext) {
              deletetask(index);
            },
          );
        },
      ),
    );
  }
}
