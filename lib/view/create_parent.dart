import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/service/parent_service.dart';
import 'package:flutter/material.dart';
import 'package:adminapp/model/parent_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateParentScreen extends StatefulWidget {
  const CreateParentScreen({super.key});

  @override
  State<CreateParentScreen> createState() => _CreateParentScreenState();
}

class _CreateParentScreenState extends State<CreateParentScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Parent")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create Parent Account",
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
                        image: AssetImage("assets/images/parents.png"),
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
                controller: phoneController,
                onChanged: (value) {},

                decoration: InputDecoration(
                  label: Text("Please Add the phone number"),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: roleController,
                decoration: InputDecoration(
                  label: Text("Please spicify the role"),
                ),
              ),
            ),

            SizedBox(height: 50),
            MaterialButton(
              onPressed: () async {
                final parent = ParentModel(
                  username: nameController.text,
                  phone_number: phoneController.text,
                  id: 0,
                  role: roleController.text,
                  is_active: true,
                );
                bool status = await ParentService().CreateNewParent(parent);
                if (status) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("yes")));
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Noo")));
                }
                // context.read<TeacherBloc>().add(
                //   CreatTeacherevent(teacherModel: teacher),
                // );
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
                    "Create Parent Account",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
