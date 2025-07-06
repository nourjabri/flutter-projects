import 'package:adminapp/Theme/drawer.dart';
import 'package:adminapp/view/tablesdata/busmentortable.dart';
import 'package:adminapp/view/tablesdata/classestable.dart';
import 'package:adminapp/view/tablesdata/parentstable.dart';
import 'package:adminapp/view/tablesdata/studentstable.dart';
import 'package:adminapp/view/tablesdata/teacherstable.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Admin Data Table"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Teachers"),
              Tab(text: "Parents"),

              Tab(text: "Bus Mentors"),
              Tab(text: "Teacher Classes"),
              Tab(text: "Students "),
            ],
          ),
        ),
        drawer: AdminDrawer(context),
        body: TabBarView(
          children: [
            TeachersTable(),
            ParentTable(),
            BusMntorTable(),
            ClassesTable(),
            StudentsTable(),
          ],
        ),
        floatingActionButton: dataButton(context),
      ),
    );
  }
}
