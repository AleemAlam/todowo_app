import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.isChecked, this.title, this.changeChecked, this.longPressFunction});
  final String title;
  final bool isChecked;
  final Function changeChecked;
  final Function longPressFunction;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressFunction,
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlue,
        value: isChecked,
        onChanged: changeChecked,
      ),
    );
  }
}
