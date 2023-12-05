import 'package:flutter/material.dart';
import 'package:house/src/modules/home_page/view/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
                    fixedSize: MaterialStateProperty.all<Size>(
                        Size(MediaQuery.of(context).size.height, 0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ))))),
        home: const HomeView());
  }
}
