import 'package:flutter/material.dart';
import 'package:ontrack/functions/database.dart';

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
              Map<String, dynamic> data = {
                "id": 1,
                "task": titleController.text,
                "discription": dripController.text
              };
              await DataBaseHelper().insertDb(data);
              Navigator.of(context).pop();
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
