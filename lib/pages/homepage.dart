import 'package:flutter/material.dart';
import 'package:ontrack/functions/cardview.dart';
import 'package:ontrack/functions/database.dart';
import 'package:ontrack/pages/addpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> data = DataBaseHelper().featchAllTasks();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "onTrack",
          style: TextStyle(color: Color.fromARGB(255, 22, 134, 7)),
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
            return ListqView.builder(
              itemCount: tasks.length,
              itemBuilder: (ctx, idx) {
                final task = tasks[idx];
                return CardView(
                  task: task['task'],
                  descption: task['discription'],
                  id: task['id'],
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
