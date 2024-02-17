import 'package:flutter/material.dart';
import 'package:to_do/widgets/star_check_box.dart';

import '../blocs/bloc_exports.dart';
import '../enums/priority_state.dart';
import '../modules/task/task.dart';

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
                AnimatedContainer(
                  height: (isExpanded) ? 42 : 0,
                  width: 130,
                  duration: Duration(milliseconds: (isExpanded) ? 400 : 35),
                  decoration: BoxDecoration(),
                  child: ElevatedButton(

                      onPressed: () {}, child: Text('Show\ndescription')),
                ),
               AnimatedContainer(
                  height: (isExpanded) ? 30 : 0,
                  duration: Duration(
                    milliseconds: (isExpanded) ? 900 : 35,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.edit, size: (isExpanded) ? 25 : 0),
                    onPressed: () {},
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
