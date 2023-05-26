import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/pages/home/home_view.dart';
import 'package:buddybuilder/pages/training/training_view.dart';
import 'package:buddybuilder/pages/create_plan/create_plan_view.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';

void main() async {
  runApp(await buildApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<Widget> buildApp() async {
  return const ProviderScope(
    child: MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      //home: const TrainingView(),
      //home: const HomeView(),
      home: const PlanView(),
    );
  }
}
