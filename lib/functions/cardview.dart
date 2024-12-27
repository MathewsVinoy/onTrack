import 'package:flutter/material.dart';
import 'package:ontrack/functions/database.dart';

class CardView extends StatelessWidget {
  final String task;
  final String descption;
  final int id;
  const CardView({
    super.key,
    required this.task,
    required this.descption,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task),
        subtitle: Text(descption),
        trailing: IconButton(
          onPressed: () async {
            await DataBaseHelper().deleteTask(id);
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
