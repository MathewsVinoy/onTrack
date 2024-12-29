import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ontrack/functions/database.dart';
import 'package:ontrack/pages/homepage.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController dripController = TextEditingController();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text("note about the content"),
            ),
            controller: dripController,
          ),
          ElevatedButton(
            onPressed: () async {
              Random random = Random();
              int idno = random.nextInt(100000);
              Map<String, dynamic> data = {
                "id": idno,
                "task": titleController.text,
                "discription": dripController.text
              };
              await DataBaseHelper().insertDb(data, 'tasks');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const HomePage(),
                ),
              );
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
