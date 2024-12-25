import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController dripController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(label: Text("Title")),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(label: Text("Title")),
            controller: dripController,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
