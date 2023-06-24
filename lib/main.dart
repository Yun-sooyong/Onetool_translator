import 'package:a_translator/screens/home_screen.dart';
import 'package:a_translator/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Onetool Translator',
        theme: themeData,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
