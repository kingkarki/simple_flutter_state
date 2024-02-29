import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_river/screens/home_screen.dart';

final ThemeData darkThemeData = ThemeData();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 95, 61, 101),
            brightness: Brightness.light,
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
            // ···
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
          ),
          body: const HomeScreen(),
        ));
  }
}
