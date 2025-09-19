import 'package:crud/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add.dart';
import 'edit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Students"),backgroundColor: Colors.teal,),
      body: studentProvider.students.isEmpty
          ? const Center(child: Text("No students yet"))
          : ListView.builder(
              itemCount: studentProvider.students.length,
              itemBuilder: (context, index) {
                final student = studentProvider.students[index];
                return ListTile(
                  title: Text(student.name),
                  subtitle: Text("Age: ${student.age}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.orange),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EditPage(
                                index: index,
                                student: student,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          studentProvider.deleteStudent(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
