import 'package:a_translator/screens/home_screen.dart';
import 'package:a_translator/screens/stt_screen.dart';
import 'package:a_translator/screens/voice_screen.dart';
import 'package:a_translator/screens/typing_screen.dart';
import 'package:a_translator/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/stt',
      builder: (context, state) => const VoiceScreen(),
    ),
    GoRoute(
      path: '/past',
      builder: (context, state) => const SttScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const TypingScreen(),
    ),
  ],
);

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
      child: MaterialApp.router(
        title: 'Onetool Translator',
        theme: themeData,
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
