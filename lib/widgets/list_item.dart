import 'package:flutter/material.dart';
import 'package:to_do/widgets/star_check_box.dart';

import '../blocs/bloc_exports.dart';
import '../enums/priority_state.dart';
import '../modules/task/task.dart';
import '../screens/add_screen.dart';
import '../screens/edit_screen.dart';

class ListItem extends StatefulWidget {
  const ListItem({super.key, required this.tasks, required this.index});
  final List<Task> tasks;
  final int index;

  @override
  State<StatefulWidget> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  var isExpanded = false;
  @override
  Widget build(BuildContext context) {
    var currentTask = widget.tasks[widget.index];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
            color: (widget.tasks[widget.index].priority == PriorityState.high)
                ? Colors.red
                : (widget.tasks[widget.index].priority == PriorityState.low)
                    ? Colors.green
                    : (widget.tasks[widget.index].priority ==
                            PriorityState.medium)
                        ? Colors.yellow
                        : Colors.black,
            width: 3.0),
      ),
      child: AnimatedContainer(
        height: (isExpanded) ? 115 : 55,
        duration: Duration(milliseconds: 250),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        icon: (isExpanded)
                            ? Icon(Icons.keyboard_arrow_up)
                            : Icon(Icons.keyboard_arrow_down)),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        currentTask.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 27,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  StarCheckBox(
                    task: widget.tasks[widget.index],
                  ),
                  Checkbox(
                    value: currentTask.isDone,
                    onChanged: (value) {
                      context
                          .read<TaskBloc>()
                          .add(UpdateTask(task: widget.tasks[widget.index]));
                    },
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                ]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: (isExpanded) ? 8 : 0,
                    ),
                    AnimatedContainer(
                      height: (isExpanded) ? 42 : 0,
                      width: 130,
                      duration: Duration(milliseconds: (isExpanded) ? 400 : 35),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                          ),
                          onPressed: () {
                            showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Task\'s description'),
                                  content: Text(
                                      widget.tasks[widget.index].description),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: const Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            'Show\ndescription',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ],
                ),
                AnimatedContainer(
                  height: (isExpanded) ? 30 : 0,
                  duration: Duration(
                    milliseconds: (isExpanded) ? 900 : 35,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.edit, size: (isExpanded) ? 25 : 0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditScreen(
                                  task: widget.tasks[widget.index])));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
