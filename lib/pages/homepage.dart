import 'package:flutter/material.dart';
import 'package:ontrack/functions/colors.dart';
import 'package:ontrack/functions/database.dart';
import 'package:ontrack/functions/refresh_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> data = DataBaseHelper().fetchAllNotes();
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
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(task['task'].toString()),
                      subtitle: Text(task['discription'].toString()),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await DataBaseHelper().deleteNote(task['id']);
                        provider.refreshList();
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(mainColor)),
                      child: const Text("Complete"),
                    )
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
