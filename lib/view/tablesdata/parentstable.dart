import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/bloc/TeacherBloc/teacher_bloc.dart';
import 'package:adminapp/bloc/parent_bloc/parent_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParentBloc, ParentState>(
      builder: (context, state) {
        if (state is TeacherLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ParentLoaded) {
          final parents = state.parents;

          return DataTable(
            columns: [
              DataColumn(
                label: Text(
                  "Parent Id",
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
                parents.map((parent) {
                  return DataRow(
                    cells: [
                      DataCell(Text(parent.id.toString())),
                      DataCell(Text(parent.username)),
                      DataCell(Text(parent.role)),
                      DataCell(Text(parent.phone_number)),
                    ],
                  );
                }).toList(),
          );
        } else if (state is ParentError) {
          return Center(child: Text("Error ${state.message}"));
        }
        return Center(child: Text("No Parents to show "));
      },
    );
  }

  FloatingActionButton parentdatabutton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<ParentBloc>().add(GetAllParents());
      },
      child: Text("Get data"),
    );
  }
}
