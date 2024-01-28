import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:truth_and_dare/pages/page_navigator.dart';
import 'package:truth_and_dare/utils/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        scaffoldBackgroundColor: AppColor.primaryColor,
      ),
      home: const Scaffold(body: PageNavigator()),
    );
  }
}
