import 'package:flutter/material.dart';

class DraggableButtonRow extends StatefulWidget {
  const DraggableButtonRow({Key? key}) : super(key: key);

  @override
  _DraggableButtonRowState createState() => _DraggableButtonRowState();
}

class _DraggableButtonRowState extends State<DraggableButtonRow> {
  List<String> buttonOrder = [
    'Button 1',
    'Button 2',
    'Button 3',
    'Button 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buttonOrder.map((buttonText) {
        final buttonIndex = buttonOrder.indexOf(buttonText);
        return Draggable<String>(
          data: buttonText,
          child: DragTarget<String>(
            builder: (context, candidateData, rejectedData) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(buttonText),
                ),
              );
            },
            onWillAccept: (data) => true,
            onAccept: (data) {
              setState(() {
                final draggedButtonIndex = buttonOrder.indexOf(data);
                buttonOrder.removeAt(draggedButtonIndex);
                buttonOrder.insert(buttonIndex, data);
              });
            },
          ),
          feedback: Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(buttonText),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
