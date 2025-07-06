import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/bloc/TeacherBloc/teacher_bloc.dart';
import 'package:adminapp/bloc/busmentor_bloc/busmentor_bloc.dart';
import 'package:adminapp/bloc/parent_bloc/parent_bloc.dart';
import 'package:adminapp/bloc/students/students_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsBloc, StudentsState>(
      builder: (context, state) {
        if (state is StudentLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SuccessLoadStudents) {
          final students = state.students;

          return DataTable(
            columns: [
              DataColumn(
                label: Text(
                  "Name",
                  style: TextStyle(color: AppColor.secondycolor),
                ),
              ),
              DataColumn(
                label: Text(
                  "Parents Id",
                  style: TextStyle(color: AppColor.secondycolor),
                ),
              ),
              DataColumn(
                label: Text(
                  "class Id",
                  style: TextStyle(color: AppColor.secondycolor),
                ),
              ),
              DataColumn(
                label: Text(
                  " profile picture",
                  style: TextStyle(color: AppColor.secondycolor),
                ),
              ),
              DataColumn(
                label: Text(
                  " Fees",
                  style: TextStyle(color: AppColor.secondycolor),
                ),
              ),
            ],
            rows:
                students.map((student) {
                  return DataRow(
                    cells: [
                      DataCell(Text(student.name)),
                      DataCell(Text(student.parent_id.toString())),
                      DataCell(Text(student.class_id.toString())),
                      DataCell(Text(student.profile_picture)),
                      DataCell(Text(student.fees.toString())),
                    ],
                  );
                }).toList(),
          );
        } else if (state is ErrorStudent) {
          return Center(child: Text("Error ${state.message}"));
        }
        return Center(child: Text("No Students accoun t to show "));
      },
    );
  }
}


