import 'package:flutter/material.dart';

class PriorityWidget extends StatefulWidget {
  const PriorityWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PriorityWidgetState();
}

class _PriorityWidgetState extends State<PriorityWidget> {
  var redIsPressed = false;
  var yellowIsPressed = false;
  var greenIsPressed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              redIsPressed = !redIsPressed;
              if (greenIsPressed) greenIsPressed = false;
              if (yellowIsPressed) yellowIsPressed = false;
            });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.red,
            ),
            child: Center(
              child: Icon(
                Icons.done,
                size: redIsPressed ? 17 : 0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              yellowIsPressed = !yellowIsPressed;
              if (greenIsPressed) greenIsPressed = false;
              if (redIsPressed) redIsPressed = false;
            });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.yellow,
            ),
            child: Center(
              child: Icon(
                Icons.done,
                size: yellowIsPressed ? 17 : 0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              greenIsPressed = !greenIsPressed;
              if (redIsPressed) redIsPressed = false;
              if (yellowIsPressed) yellowIsPressed = false;
            });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.green,
            ),
            child: Center(
              child: Icon(
                Icons.done,
                size: greenIsPressed ? 17 : 0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
