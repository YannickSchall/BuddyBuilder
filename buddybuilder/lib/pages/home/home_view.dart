//import 'package:buddybuilder/db/book_model.dart';
import 'package:buddybuilder/pages/training/training_view.dart';
import 'package:buddybuilder/services/db/collections/list_exercise.dart';
import 'package:buddybuilder/services/db/collections/split.dart';
import 'package:buddybuilder/services/db/isar_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import 'package:buddybuilder/components/containerbutton.dart';
import 'package:buddybuilder/material_theme/customicon.dart';
import 'package:buddybuilder/components/datewidget.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  void showSuccessDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No split selected for today!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Theme.of(context).colorScheme.onSecondaryContainer)),
          actions: [
            MaterialButton(
              child: const Text('OK', textAlign: TextAlign.left),
              color: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.secondaryContainer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          actionsAlignment: MainAxisAlignment.spaceBetween,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller = ref.read(providers.homeControllerProvider.notifier);
    final HomeModel model = ref.watch(providers.homeControllerProvider);

    return Scaffold(
      appBar: GymAppBar(
        title: 'BUDDY\nBUILDER',
        titleAlignment: Alignment.centerRight,
        showBackButton: false,
        showOkButton: false,
        onBackButtonPressed: () {},
        onOkButtonPressed: () {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PillButtonWidget(
              onPressed: () => Navigator.pushNamed(context, '/calendar'),
              text: 'CALENDAR',
              dateWidget: const DayMonthWidget(),
              buttonHeight: 100.0,
            ),
            FutureBuilder<Split>(
              future: controller.getTodaysSplitID(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ContainerButtonWidget(
                    onPressed: () {
                      Split? split = snapshot.data;

                      if (split?.id == null || split == null) {
                        showSuccessDialog(context);
                      } else {
                        int splitID = split.id!;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrainingView(
                                  splitID: splitID,
                                  splitName: snapshot.data!.name!,
                                )),
                      );
                      }

                      
                    },
                    text: snapshot.data!.name ?? 'REST',
                    containerIcon: Icon(Icons.more_horiz, color: Theme.of(context).colorScheme.primary),
                  );
                }
              },
            ),
            PillButtonWidget(
                onPressed: () => Navigator.pushNamed(context, '/plan'),
                text: 'BUILD PLAN',
                icon: Icon(CustomIcons.gymplan, color: Theme.of(context).colorScheme.onPrimaryContainer)),
            PillButtonWidget(
                onPressed: () => Navigator.pushNamed(context, '/settings'), text: 'SETTINGS', icon: Icon(Icons.settings, color: Theme.of(context).colorScheme.onPrimaryContainer)),
          ],
        ),
      ),
    );
  }
}

abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(HomeModel state) : super(state);
  Future<Split> getTodaysSplitID();
}
