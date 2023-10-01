import 'package:flutter/material.dart';
import 'package:todo/utils/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.oncancel,
      required this.onsave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // adding texts

            TextField(
              controller: controller,
              decoration: InputDecoration(
                  fillColor: Colors.black,
                  border: OutlineInputBorder(),
                  hintText: "Add your Task"),
            ),

            // save button and cancel button

            const SizedBox(
              height: 8,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // cancel buttom
                MyButtons(text: "Cancel", onpressed: oncancel),

                // save button
                MyButtons(text: "Save", onpressed: onsave)
              ],
            )
          ],
        ),
      ),
    );
  }
}
