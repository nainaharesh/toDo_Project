import 'package:flutter/material.dart';
import 'package:todoapp/components/btn_controller.dart';
import 'package:todoapp/edit_student_data.dart';
import 'addstudent.dart';

class Mockup extends StatefulWidget {
  const Mockup({super.key});

  @override
  State<Mockup> createState() => _MyWidgetState();
}

class Student {
  String name;
  String fatherName;
  int id;

  Student({
    required this.name,
    required this.fatherName,
    required this.id,
  });
}

class _MyWidgetState extends State<Mockup> {
  List<Student> students = [
    Student(id: 71, name: "Naina", fatherName: "Haresh"),
    Student(id: 33, name: "Ali", fatherName: "Ahmed"),
    Student(id: 22 ,name: "Sara", fatherName: "Khan"),
  ];

  void deleteStudent({required int index}) {
    setState(() {
      students.removeAt(index);
    });
  }

  Widget myStudentCard(Student student, int index) {
    return Card(
      child: ListTile(
        title: Text(student.id.toString()),
        subtitle: Text(
          " ${student.name}\n ${student.fatherName}",
        ),
       trailing: Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Custombtn(
      customcolor: Colors.black,
      buttonicon: Icons.edit,
      onbtnTap: () async {
        final Student updatedStudent = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditStudent(
              student: student,
            ),
          ),
        );

        setState(() {
          students[index] = updatedStudent;
        });
      },
    ),

    const SizedBox(width: 10),

    Custombtn(
      customcolor: Colors.red,
      buttonicon: Icons.delete,
      onbtnTap: () {
        deleteStudent(index: index);
      },
    ),
  ],
),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Data Entry'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return myStudentCard(
            students[index],
            index,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Student? newStudent = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ForStudentAddStudent(),
            ),
          );

          if (newStudent != null) {
            setState(() {
              students.add(newStudent);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
