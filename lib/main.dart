import 'package:flutter/material.dart';
import 'package:game_app/provider/game_provider.dart';
import 'package:game_app/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameProvider>(
        create: (_) => GameProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Helvetica'),
            home: const HomePage()));
  }
}
