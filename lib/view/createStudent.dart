import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/model/parent_model.dart';
import 'package:adminapp/model/studentmodel.dart';
import 'package:adminapp/service/parent_service.dart';
import 'package:adminapp/service/student_sercive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateStudentScreen extends StatefulWidget {
  const CreateStudentScreen({super.key});

  @override
  State<CreateStudentScreen> createState() => _CreateStudentScreenState();
}

class _CreateStudentScreenState extends State<CreateStudentScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController parentController = TextEditingController();
  final TextEditingController photoController = TextEditingController();
  List<ParentModel> parents = [];
  int? selectedParent;
  void loadParents() async {
    parents = await ParentService().GethAllParents();
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
                  "Create Student",
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
                      image: AssetImage("assets/images/student.png"),
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
                label: Text("Please Add the user name"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: parentController,
              keyboardType: TextInputType.number,
              onChanged: (value) {},

              decoration: InputDecoration(
                label: Text("Please Add the parent Id"),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: classController,
              decoration: InputDecoration(label: Text("Please add class Id")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Add photo"),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_photo_alternate),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          MaterialButton(
            onPressed: () async {
              final student = StudentModel(
                id: 0,
                name: nameController.text,
                class_id: int.parse(classController.text),
                parent_id: int.parse(parentController.text),
                profile_picture: "photoController.text",
                fees: 5,
              );
              bool status = await StundetService().createNewStudent(student);
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
                  "Create Student",
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
