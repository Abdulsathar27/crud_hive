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
      appBar: AppBar(
        title: const Text(
          "Edit Student",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
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
            const SizedBox(height: 12),
            TextField(
              controller: classController,
              decoration: const InputDecoration(labelText: "Subjet"),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              onPressed: () async {
                await context.read<StudentProvider>().updateStudent(
                  student,
                  newName: nameController.text,
                  newAge: int.tryParse(ageController.text) ?? 0,
                  newAddress: addressController.text,
                  newClassname: classController.text,
                );

                Navigator.pop(context);
              },
              child: const Text(
                "✏️ Update",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
