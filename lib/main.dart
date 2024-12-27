import 'package:flutter/material.dart';
import 'package:ontrack/functions/colors.dart';
import 'package:ontrack/functions/refresh_screen.dart';
import 'package:ontrack/pages/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => RefreshScreen())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
