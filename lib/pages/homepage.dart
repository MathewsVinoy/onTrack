import 'package:flutter/material.dart';
import 'package:ontrack/functions/cardview.dart';
import 'package:ontrack/functions/colors.dart';
import 'package:ontrack/functions/database.dart';
import 'package:ontrack/functions/refresh_screen.dart';
import 'package:ontrack/pages/addpage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> data = DataBaseHelper().featchAllTasks();
    final provider = Provider.of<RefreshScreen>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "onTrack",
          style: TextStyle(color: mainColor),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
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
                    await DataBaseHelper().deleteTask(task['id']);
                    provider.refreshList();
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => const AddPage(),
            ),
          );
        },
        backgroundColor: mainColor.withOpacity(0.5),
        child: const Icon(Icons.add),
      ),
    );
  }
}
