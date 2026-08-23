import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/product_form_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      routes: {
        HomePage.id: (context) => HomePage(),
        ProductFormPage.id: (context) => const ProductFormPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
