import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/bloc/busmentor_bloc/busmentor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusMntorTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusmentorBloc, BusMentorState>(
      builder: (context, state) {
        if (state is MentorLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MentorSuccessLoading) {
          final mentors = state.mentors;

          return DataTable(
            columns: [
              DataColumn(
                label: Text(
                  "Bus Mentor Id",
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
                mentors.map((mentor) {
                  return DataRow(
                    cells: [
                      DataCell(Text(mentor.id.toString())),
                      DataCell(Text(mentor.username)),
                      DataCell(Text(mentor.role)),
                      DataCell(Text(mentor.phone_number)),
                    ],
                  );
                }).toList(),
          );
        } else if (state is ErrorMentor) {
          return Center(child: Text("Error ${state.message}"));
        }
        return Center(child: Text("No  Bus Mentors to show "));
      },
    );
  }
}
