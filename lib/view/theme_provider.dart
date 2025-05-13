import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangment_intro/model/theme_model.dart';

class ThemeProvider extends StatelessWidget {
  const ThemeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeManagerProvider(),
      child: Consumer<ThemeManagerProvider>(
        builder: (context, data, _) {
          return MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            darkTheme: ThemeData(scaffoldBackgroundColor: Colors.blueGrey),
            themeMode:
                context.read<ThemeManagerProvider>().isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
            home: Homepage(),
          );
        },
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            context.read<ThemeManagerProvider>().changetheme();
          },
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
