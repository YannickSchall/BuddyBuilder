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
import 'package:buddybuilder/material_theme/color_schemes.g.dart';

class ChooseSplitView extends ConsumerWidget {
  const ChooseSplitView({Key? key}) : super(key: key);

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('What is a Split Style'),
        content: const Text(
            'Rotation: define an order of sets \n- drag into right order -\n\nWeekly: map sets on weekdays'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: GymAppBar(
        subTitle: '',
        titleAlignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: false,
        onBackButtonPressed: () => Navigator.pushNamed(context, '/workout'),
        onOkButtonPressed: () {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('SPLIT',
                    style: const TextStyle(
                        fontSize: 34, fontWeight: FontWeight.bold)),
                Text('STYLE',
                    style: const TextStyle(
                        fontSize: 34, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            PillButtonWidget(
              onPressed: () => Navigator.pushNamed(context, '/weekly'),
              text: 'ROTATION',
            ),
            const SizedBox(height: 10),
            PillButtonWidget(
              onPressed: () => Navigator.pushNamed(context, '/weekly'),
              text: 'WEEKLY',
            ),
            IconButton(
              icon: Icon(Icons.info),
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              onPressed: () {
                _showInfoDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
