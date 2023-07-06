import 'dart:ffi';

import 'package:buddybuilder/pages/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/pages/weekly/weekly_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/pages/home/home_view.dart';
import 'package:buddybuilder/pages/training/training_view.dart';
import 'package:buddybuilder/pages/calendar/calendar_view.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/pages/create_plan/01_edit_plan/edit_plan_view.dart';
import 'package:buddybuilder/services/db/isar_database.dart';
import 'common/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarDatabase.instance.initialize();
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
    final HomeModel homeModel = HomeModel(isDarkModeEnabled: true);

    return Consumer(builder: (context, ref, _) {
      return MaterialApp(
        theme: ref.watch(providers.settingsControllerProvider).isDarkModeEnabled
            ? ThemeData(useMaterial3: true, colorScheme: darkColorScheme)
            : ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        home: Navigator(
          initialRoute: '/home',
          onGenerateRoute: (RouteSettings routeParams) {
            if (routeParams.name == '/home') {
              return MaterialPageRoute(builder: (context) => const HomeView());
            } else if (routeParams.name == '/calendar') {
              return MaterialPageRoute(builder: (context) => CalendarView());
            } else if (routeParams.name == '/settings') {
              return MaterialPageRoute(
                  builder: (context) => const SettingsView());
            } else if (routeParams.name == '/weekly') {
              return MaterialPageRoute(
                  builder: (context) => const WeeklyView());
            } else if (routeParams.name == '/plan') {
              return MaterialPageRoute(
                  builder: (context) => const EditPlanView());
            }
          },
          onPopPage: (route, result) {
            return route.didPop(result);
          },
        ),
      );
    });
  }
}
