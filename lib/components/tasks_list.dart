import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todowo/components/task_tile.dart';
import 'package:todowo/data/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              title: task.name,
              isChecked: task.isDone,
              changeChecked: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressFunction: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('DELETE'),
                      content: Text('Are You Sure?'),
                      actions: [
                        FlatButton(
                          child: Text('Yes'),
                          onPressed: () {
                            taskData.deleteTask(task);
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  },
                );
              },
            );
          },
          itemCount: taskData.tasksCount,
        );
      },
    );
  }
}
