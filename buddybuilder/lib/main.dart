import 'package:buddybuilder/pages/create_plan/01_plans/plans_view.dart';
import 'package:buddybuilder/pages/create_plan/02_split/split_view.dart';
import 'package:buddybuilder/pages/create_plan/03_workout/workout_view.dart';
import 'package:buddybuilder/pages/create_plan/04_set/set_view.dart';
import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/pages/splits/weekly/weekly_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/pages/home/home_view.dart';
import 'package:buddybuilder/pages/training/training_view.dart';
import 'package:buddybuilder/pages/calendar/calendar/calendar_view.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/pages/choose_split_view.dart';

import 'common/providers.dart';

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
    final HomeModel homeModel = HomeModel(isDarkModeEnabled: true);

    return Consumer(builder: (context, ref, _) {
      return MaterialApp(
        theme: ref.watch(providers.homeControllerProvider).isDarkModeEnabled
            ? ThemeData(useMaterial3: true, colorScheme: darkColorScheme)
            : ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        home: Navigator(
          initialRoute: '/home',
          onGenerateRoute: (RouteSettings routeParams) {
            if (routeParams.name == '/home') {
              return MaterialPageRoute(builder: (context) => const HomeView());
            } else if (routeParams.name == '/calendar') {
              return MaterialPageRoute(
                  builder: (context) => const CalendarView());
            } else if (routeParams.name == '/training') {
              return MaterialPageRoute(
                  builder: (context) => const TrainingView());
            } else if (routeParams.name == '/plan') {
              return MaterialPageRoute(builder: (context) => const PlanView());
            } else if (routeParams.name == '/rotate') {
              return MaterialPageRoute(
                  builder: (context) => const WeeklyView());
            } else if (routeParams.name == '/weekly') {
              return MaterialPageRoute(
                  builder: (context) => const ChooseSplitView());
            } else if (routeParams.name == '/choose') {
              return MaterialPageRoute(
                  builder: (context) => const ChooseSplitView());
            } else if (routeParams.name == '/split') {
              return MaterialPageRoute(builder: (context) => const SplitView());
            } else if (routeParams.name == '/workout') {
              return MaterialPageRoute(
                  builder: (context) => const WorkoutView());
            } else if (routeParams.name == '/set') {
              return MaterialPageRoute(builder: (context) => const SetView());
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
