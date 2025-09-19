import 'package:crud/model/model.dart';
import 'package:crud/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final addressController = TextEditingController();
    final classController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Add Student")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: "Age"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: "Address"),
            ),
            TextField(
              controller: classController,
              decoration: const InputDecoration(labelText: "Subjet"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final student = StudentModel(
                  name: nameController.text,
                  age: int.tryParse(ageController.text) ?? 0,
                  address: addressController.text,
                  classname: classController.text,
                  addedOn: DateTime.now(),
                );
                context.read<StudentProvider>().addStudent(student);
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
