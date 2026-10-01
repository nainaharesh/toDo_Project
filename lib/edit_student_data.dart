import 'package:flutter/material.dart';
import 'package:todoapp/components/btn_controller.dart';
import 'package:todoapp/components/text_field.dart';
import 'package:todoapp/todoproject.dart';

class EditStudent extends StatefulWidget {
  final Student student;

  const EditStudent({super.key, required this.student});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  late TextEditingController nameController;
  late TextEditingController fatherNameController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.student.name);

    fatherNameController = TextEditingController(
      text: widget.student.fatherName,
    );
  }

  void updateStudent() {
    Student updatedStudent = Student(
      id: widget.student.id,
      name: nameController.text,
      fatherName: fatherNameController.text,
    );

    Navigator.pop(context, updatedStudent);
  }

  @override
  void dispose() {
    nameController.dispose();
    fatherNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Edit Student") )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Customtextfeild(
              componentController: nameController,
              hintText: 'Update Name',
            ),
            Customtextfeild(
              componentController: fatherNameController,
              hintText: 'Update Father Name',
            ),
            Custombtn(
              label: "Update Student",
              customcolor: Colors.brown,
              width: 150,
              onbtnTap: updateStudent,
            ),
          ],
        ),
      ),
    );
  }
}
