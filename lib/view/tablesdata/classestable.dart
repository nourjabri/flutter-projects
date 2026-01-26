import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/bloc/classes/classes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassesBloc, ClassesState>(
      builder: (context, state) {
        if (state is classesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ClassesloadedSuccess) {
          final classes = state.classes;

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
            ],
            rows:
                classes.map((teacherclass) {
                  return DataRow(
                    cells: [
                      DataCell(Text(teacherclass.teacher_id.toString())),
                      DataCell(Text(teacherclass.name)),
                    ],
                  );
                }).toList(),
          );
        } else if (state is ErrorClasses) {
          return Center(child: Text("Error ${state.message}"));
        }
        return Center(child: Text("No Teacher Classes to show "));
      },
    );
  }
}
