import 'package:flutter/material.dart';
import 'package:tres_b_tech/config/router/app_pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppPages.router,
    );
  }
}
