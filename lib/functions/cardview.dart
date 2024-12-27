import 'package:flutter/material.dart';
import 'package:ontrack/functions/colors.dart';

class CardView extends StatelessWidget {
  final Map<String, dynamic> task;
  final VoidCallback onPressed;
  const CardView({super.key, required this.task, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task['task'].toString()),
        subtitle: Text(task['discription'].toString()),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.delete,
            color: mainColor,
          ),
        ),
      ),
    );
  }
}
