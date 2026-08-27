import 'package:flutter/material.dart';
import 'package:store_app/constant/app_color.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/product_form_page.dart';

void main() {
  runApp(const NewTrendApp());
}

class NewTrendApp extends StatelessWidget {
  const NewTrendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: 'New Trend',
      routes: {
        HomePage.id: (context) => HomePage(),
        ProductFormPage.id: (context) => const ProductFormPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
