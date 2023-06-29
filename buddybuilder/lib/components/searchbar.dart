import 'package:buddybuilder/components/pillbutton.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const MySearchBar({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 12.0),
            ),
          ),
        ),
        // Add a conditional statement here to display search results
      ],
    );
  }
}
