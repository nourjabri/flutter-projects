import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/view/Loginscreen.dart';
import 'package:adminapp/view/createClass.dart';
import 'package:adminapp/view/createStudent.dart';
import 'package:adminapp/view/createTeacher.dart';
import 'package:adminapp/view/create_busMentor.dart';
import 'package:adminapp/view/create_parent.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Drawer AdminDrawer(BuildContext context) {
  return Drawer(
    child: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              selectedColor: AppColor.secondycolor,
              leading: Image(image: AssetImage("assets/images/teacher.png")),
              title: Text(
                "Create Teacher",
                style: TextStyle(color: AppColor.primarycolor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Createteacherscreen()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/student.png")),
              title: Text(
                "Create Student",
                style: TextStyle(color: AppColor.primarycolor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CreateStudentScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/parents.png")),
              title: Text(
                "Create Parent",
                style: TextStyle(color: AppColor.primarycolor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CreateParentScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/school-bus.png")),
              title: Text(
                "Create Bus_mentor",
                style: TextStyle(color: AppColor.primarycolor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CreateBusMentoscreen()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/class.png")),
              title: Text(
                "Create Class",
                style: TextStyle(color: AppColor.primarycolor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CreateClassScreen()),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 20),
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/logout.png")),
              title: Text(
                "Logout ",
                style: TextStyle(color: AppColor.primarycolor),
              ),
              onTap: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text("Logout"),
                        content: Text("Do You sure to logout"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text("Confrim"),
                          ),
                        ],
                      ),
                );

                if (confirm == true) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('access_token');
                  await prefs.remove('refresh_token');

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                    (route) => false,
                  );
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}
