import 'package:dio/dio.dart';
import 'package:fashionproject/Presentation/Logic/logout/logout_cubit.dart';
import 'package:fashionproject/Presentation/Logic/order/order_cubit.dart';
import 'package:fashionproject/Presentation/screens/loginScreens.dart';
import 'package:fashionproject/core/utils/session_manger.dart';
import 'package:fashionproject/data/Repository/order_remotedata_Impl.dart';
import 'package:fashionproject/data/Repository/order_repository_impl.dart';
import 'package:fashionproject/domain/useCase/orderUseCase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrders extends StatelessWidget {
  MyOrders({super.key});
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(
        Orderusecase(OrderRepositoryImpl(OrderRemoteDataSourceImpl(dio))),
      ),
      child: BlocListener<OrderCubit, OrderState>(
        listener: (context, state) {
          if (state is OrderLoaded) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Loginscreen()),
              (Route<dynamic> route) => false,
            );
          }
          if (state is OrderLoading) {
            CircularProgressIndicator();
          }
          if (state is OrderError) {
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