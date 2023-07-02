import 'package:flutter/material.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';

class SearchWidget extends StatefulWidget {
  final String value;
  final void Function() onPressed;

  const SearchWidget({
    Key? key,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.value;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              // Update the value when the text field value changes
              widget.onPressed();
            },
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: widget.onPressed,
        ),
      ],
    );
  }
}
