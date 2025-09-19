import 'package:crud/model/model.dart';
import 'package:crud/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EditPage extends StatelessWidget {
  final int index;
  final StudentModel student;

  const EditPage({super.key, required this.index, required this.student});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: student.name);
    final ageController = TextEditingController(text: student.age.toString());
    final addressController = TextEditingController(text: student.address);
    final classController = TextEditingController(text: student.classname);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Student")),
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
                final updated = StudentModel(
                  name: nameController.text,
                  age: int.tryParse(ageController.text) ?? 0, 
                  address: addressController.text,
                  classname: classController.text, 
                  addedOn: DateTime.now(), 
                );
                context.read<StudentProvider>().updateStudent(index, updated);
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
