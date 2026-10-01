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
    if (name.isNotEmpty || fathername.isNotEmpty) {
      final newStudent = Student(
        id: Random().nextInt(9000) + 1000,
        name: name,
        fatherName: fathername,
      );

      Navigator.pop(context, newStudent);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Name and Father name cannot be empty"),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.pinkAccent,
        ),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    fathernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            Customtextfeild(
              componentController: nameController,
              hintText: 'Enter Name',
            ),
            Customtextfeild(
              componentController: fathernameController,
              hintText: 'Enter Father Name',
            ),

            Custombtn(
              label: "Add",
              customcolor: Colors.brown,
              onbtnTap: () {
                saveStudent();
              }, 
            ),
          ],
        ),
      ),
    );
  }
}
