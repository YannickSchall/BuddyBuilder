import 'package:flutter/material.dart';

class HTWGText extends StatelessWidget {
  final String semester;
  final String appName;

  const HTWGText(this.semester, this.appName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Text(
              semester,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Text(
            appName,
          ),
        ],
      );
}
