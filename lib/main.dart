import 'package:chilly/app/routing/router.dart';
import 'package:chilly/app/style/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorSchemeSeed: AppColors.red,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
