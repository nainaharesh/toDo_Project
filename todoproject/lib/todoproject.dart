import 'package:flutter/material.dart';

class Mockup extends StatefulWidget {
  const Mockup({super.key});

  @override
  State<Mockup> createState() => _MyWidgetState();
}

class Student {
  String name;
  String fatherName;
  List<String>? subjects;

  Student({required this.name, required this.fatherName, this.subjects});
}

class _MyWidgetState extends State<Mockup> {
  String display = 'Students';

  List<Student> students = [
    Student(name: "Naina", fatherName: "Haresh"),
    Student(name: "Ali", fatherName: "Ahmed"),
    Student(name: "Malaika", fatherName: "Khalid"),
    Student(name: "Anusha", fatherName: "Ahad"),
    Student(name: "Alishba", fatherName: "Nasir"),
    Student(name: "Umama", fatherName: "Ahmed"),
  ];

  Widget myStudentCard(Student student) {
    return Card(
      child: ListTile(
        title: Text(student.name),
        subtitle: Text(student.fatherName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Data Entry Mockup')),

      body: Column(
        children: [
          ListView.builder(
            itemCount: students.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return myStudentCard(students[index]);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          students.add(
            Student(
              name: "New Student ${students.length + 1}",
              fatherName: "New father Name",
            ),
          );
          
        },
        child:
          const Icon(Icons.add),
      ),
    );
  }
}
