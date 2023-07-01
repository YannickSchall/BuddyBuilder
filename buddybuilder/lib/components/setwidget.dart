import 'package:flutter/material.dart';
import 'package:buddybuilder/components/pillbutton.dart';

class SetWidget extends StatefulWidget {
  const SetWidget({
    Key? key,
    required this.setTitle,
    required this.setNumber,
    required this.kgValue,
    required this.repsValue,
  }) : super(key: key);

  final String setTitle;
  final int setNumber;
  final String kgValue;
  final String repsValue;

  @override
  _SetWidgetState createState() => _SetWidgetState();
}

class _SetWidgetState extends State<SetWidget> {
  List<Widget> additionalSets = [];

  void addSet() {
    setState(() {
      final nextSetNumber = widget.setNumber + 1;
      additionalSets.add(
        Row(
          children: [
            Text('Set $nextSetNumber:'),
            SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Reps',
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight',
                ),
              ),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                // Handle onPressed action
              },
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.setTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text('Sets - '),
            Text('kg - '),
            Text('reps -'),
            Icon(Icons.check, color: Colors.green),
          ],
        ),
        Row(
          children: [
            Text('Set ${widget.setNumber}:'),
            Spacer(),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Reps',
                ),
              ),
            ),
            Spacer(),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Weight',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                // Handle onPressed action
              },
            ),
          ],
        ),
        SizedBox(height: 8),
        ...additionalSets,
        PillButtonWidget(
          onPressed: addSet,
          text: 'Add Set',
          buttonHeight: 20,
          buttonWidth: 100,
        ),
      ],
    );
  }
}
