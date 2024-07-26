import 'package:flutter/material.dart';
import 'package:subham_jyoti_portfolio_flutter/design/utils/app_theme.dart';
import 'package:subham_jyoti_portfolio_flutter/features/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subham Jyoti 👋 | AI-Engineer and Researcher ',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}