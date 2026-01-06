import 'package:fashionproject/Presentation/Logic/logout/logout_cubit.dart';
import 'package:fashionproject/Presentation/Logic/order/order_cubit.dart';
import 'package:fashionproject/Presentation/screens/tips.dart';
import 'package:fashionproject/core/injection_container.dart';
import 'package:fashionproject/domain/useCase/logoutUseCase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: [...DevicePreview.defaultTools],
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LogoutCubit(LogoutUseCase())),
          BlocProvider<OrderCubit>(
            create: (context) => OrderCubit(orderusecase: orderusecase),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 850),
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,

        home: TipsScreen(),
      ),
    );
  }
}
