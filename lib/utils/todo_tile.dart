import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onchanged;
  Function(BuildContext)? deletetask;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onchanged,
      required this.deletetask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
              onPressed: deletetask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12))
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              // check box option

              Checkbox(
                value: taskCompleted,
                onChanged: onchanged,
                activeColor: Colors.black,
              ),

              // task name
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
