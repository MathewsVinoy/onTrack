import 'package:flutter/material.dart';
import 'package:ontrack/functions/database.dart';
import 'package:ontrack/pages/addpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> data = featchAllTasks();
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
          final tasks = spst.data!;
          return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (ctx, idx) {
                final task = tasks[idx];
                return Text(task['task']);
              });
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
