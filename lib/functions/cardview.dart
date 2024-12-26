import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String task;
  final String descption;
  const CardView({super.key, required this.task, required this.descption});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task),
        subtitle: Text(descption),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
