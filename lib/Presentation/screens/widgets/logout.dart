import 'package:fashionproject/Presentation/Logic/logout/logout_cubit.dart';
import 'package:fashionproject/Presentation/screens/loginScreens.dart';
import 'package:fashionproject/core/utils/session_manger.dart';
import 'package:fashionproject/domain/useCase/logoutUseCase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(LogoutUseCase()),
      child: BlocListener<LogoutCubit, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Loginscreen()),
              (Route<dynamic> route) => false,
            );
          }

          if (state is LogoutError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: ListTile(
          leading: TextButton(
            onPressed: () async {
              _showLogoutDialog(context);
              await SessionManager.saveToken("dummy_token");
            },
            child: Text(
              "Logout",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),

          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("confirm Logout"),
      content: Text('Are your sure to logout'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<LogoutCubit>().logout();
          },
          child: Text("Logout"),
        ),
      ],
    ),
  );
}
