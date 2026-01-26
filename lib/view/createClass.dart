import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/model/TeacherClasses.dart';
import 'package:adminapp/model/TeacherModel.dart';
import 'package:adminapp/service/class_service.dart';
import 'package:adminapp/service/teacher_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateClassScreen extends StatefulWidget {
  const CreateClassScreen({super.key});

  @override
  State<CreateClassScreen> createState() => _CreateClassScreenState();
}

class _CreateClassScreenState extends State<CreateClassScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController teacherIdController = TextEditingController();
  List<TeacherModel> teacherList = [];
  int? selectedTeacherId;
  @override
  void iniState() {
    super.initState();
    loadTeachers();
  }

  void loadTeachers() async {
    teacherList = await TeacherService().getAllTeachers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Create Class",
                  style: TextStyle(
                    color: AppColor.primarycolor,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  width: 100.h,
                  height: 100.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/class.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              onChanged: (value) {},

              decoration: InputDecoration(
                label: Text("Please Add the Class Name"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: teacherIdController,
              onChanged: (value) {},

              decoration: InputDecoration(
                label: Text("Please Add the Teacher Id"),
              ),
            ),
          ),

          // DropdownButton<int>(
          //   value: selectedTeacherId,
          //   items:
          //       teacherList.map((teacher) {
          //         return DropdownMenuItem<int>(
          //           value: teacher.id,
          //           child: Text(teacher.username),
          //         );
          //       }).toList(),
          //   onChanged: (value) {
          //     setState(() {
          //       selectedTeacherId = value!;
          //     });
          //   },
          // ),
          SizedBox(height: 50),
          MaterialButton(
            onPressed: () async {
              final teacherclass = TeacherClasses(
                name: nameController.text,
                teacher_id: int.parse(teacherIdController.text),
                id: 0,
              );
              bool status = await TeacherClassService().createTeacherclass(
                teacherclass,
              );
              if (status) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("yes")));
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Noo")));
              }
            },
            child: Container(
              height: 54.h,
              width: 115.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [AppColor.primarycolor, AppColor.secondycolor],
                ),
              ),
              child: Center(
                child: Text(
                  "Create Class ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
