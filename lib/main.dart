import 'package:flutter/material.dart';
import 'package:ontrack/functions/colors.dart';
import 'package:ontrack/functions/refresh_screen.dart';
import 'package:ontrack/pages/nave_bar.dart';
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
        color: mainColor,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        ),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        home: const NaveBarComp(),
      ),
    );
  }
}
