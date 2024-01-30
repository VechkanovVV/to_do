import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/task_bloc.dart';


class StarCheckBox extends StatefulWidget {
  final task;

  StarCheckBox({super.key, required this.task});

  @override
  State<StatefulWidget> createState() => _StarCheckBoxState();
}

class _StarCheckBoxState extends State<StarCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          context
              .read<TaskBloc>()
              .add(TopTask(task: widget.task));
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.star_border,
            color: Colors.black,
            size: 32.0,
          ),
          Icon(
            Icons.star,
            color: widget.task.isFavourite ? Colors.yellow : Colors.transparent,
            size: 32.0,
          ),
        ],
      ),
    );
  }
}
