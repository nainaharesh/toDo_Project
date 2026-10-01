import 'package:flutter/material.dart';
import 'package:todoapp/components/btn_controller.dart';
import 'package:todoapp/components/text_field.dart';
import 'package:todoapp/todoproject.dart';
import 'dart:math';

class ForStudentAddStudent extends StatefulWidget {
  const ForStudentAddStudent({super.key});

  @override
  State<ForStudentAddStudent> createState() => _ForStudentAddStudentState();
}

class _ForStudentAddStudentState extends State<ForStudentAddStudent> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController fathernameController = TextEditingController();

  void saveStudent() {
    String name = nameController.text;
    String fathername = fathernameController.text;

    final newStudent = Student(
      id: Random().nextInt(9000) + 1000,
      name: name,
      fatherName: fathername,
    );

    Navigator.pop(context, newStudent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Customtextfeild(componentController: nameController,hintText: "Enter Name",),
           Customtextfeild(componentController: fathernameController,hintText: "Enter Father Name",),
            Custombtn(
  label: 'Add Student',
  customcolor: Colors.brown,
  buttonicon: Icons.add,
  onbtnTap: saveStudent,
)
            
          ],
        ),
      ),
    );
  }
}
