import 'package:flutter/material.dart';
import 'package:ontrack/functions/cardview.dart';
import 'package:ontrack/functions/database.dart';
import 'package:ontrack/functions/refresh_screen.dart';
import 'package:provider/provider.dart';

class TasksListPage extends StatelessWidget {
  const TasksListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> data = DataBaseHelper().fetchAllTasks();
    final provider = Provider.of<RefreshScreen>(context);
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: data,
      builder: (ctx, spst) {
        if (spst.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (spst.hasError) {
          return Center(
            child: Text('Error: ${spst.error}'),
          );
        } else if (!spst.hasData || spst.data!.isEmpty) {
          return const Center(
            child: Text("no data"),
          );
        } else {
          final tasks = spst.data!;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (ctx, idx) {
              final task = tasks[idx];
              return CardView(
                task: task,
                onPressed: () async {
                  await DataBaseHelper().insertDb(task, 'notes');
                  await DataBaseHelper().deleteTask(task['id']);
                  provider.refreshList();
                },
              );
            },
          );
        }
      },
    );
  }
}
