import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/bloc/TeacherBloc/teacher_bloc.dart';
import 'package:adminapp/bloc/busmentor_bloc/busmentor_bloc.dart';
import 'package:adminapp/bloc/classes/classes_bloc.dart';
import 'package:adminapp/bloc/parent_bloc/parent_bloc.dart';
import 'package:adminapp/bloc/students/students_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeachersTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherBloc, TeacherState>(
      builder: (context, state) {
        if (state is TeacherLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TeacherLoadedSuccess) {
          final teachers = state.teachers;

          return DataTable(
            columns: [
              DataColumn(
                label: Text(
                  "Teacher Id",
                  style: TextStyle(color: AppColor.secondycolor),
                ),
              ),
              DataColumn(
                label: Text(
                  "Name",
                  style: TextStyle(color: AppColor.secondycolor),
                ),
              ),
              DataColumn(
                label: Text(
                  "Role",
                  style: TextStyle(color: AppColor.secondycolor),
                ),
              ),
              DataColumn(
                label: Text(
                  "Phone",
                  style: TextStyle(color: AppColor.secondycolor),
                ),
              ),
            ],
            rows:
                teachers.map((teacher) {
                  return DataRow(
                    cells: [
                      DataCell(Text(teacher.id.toString())),
                      DataCell(Text(teacher.username)),
                      DataCell(Text(teacher.role)),
                      DataCell(Text(teacher.phoneNumber)),
                    ],
                  );
                }).toList(),
          );
        } else if (state is Error) {
          return Center(child: Text("Error ${state.message}"));
        }
        return Center(child: Text("No Teachers to show "));
      },
    );
  }
}

FloatingActionButton dataButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      context.read<TeacherBloc>().add(GetAllTeacherEvent());
      context.read<ParentBloc>().add(GetAllParents());
      context.read<BusmentorBloc>().add(GetAllMentorEvent());
      context.read<ClassesBloc>().add(GetAllTeacherClasses());
      context.read<StudentsBloc>().add(GetAllStudents());
    },
    child: Text("Get data"),
  );
}
