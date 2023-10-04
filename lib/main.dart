import 'package:flutter/material.dart';
import 'package:movie/screens/details_screen.dart';
import 'package:movie/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        DetailsScreen.routeName: (context) => DetailsScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
