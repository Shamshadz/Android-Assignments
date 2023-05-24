import 'package:flutter/material.dart';

class AutoCplView extends StatefulWidget {
  @override
  _AutoCplViewState createState() => _AutoCplViewState();
}

class _AutoCplViewState extends State<AutoCplView> {
  @override
  Widget build(BuildContext context) {
    List<String> items = ['apple', 'banana', 'cherry', 'durian'];

    final TextEditingController _textEditingController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Autocomplete TextField '),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return items.where((String option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selection) {
              _textEditingController.text = selection;
            },
            fieldViewBuilder: (BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted) {
              return TextField(
                controller: textEditingController,
                focusNode: focusNode,
                onSubmitted: (String value) {
                  onFieldSubmitted();
                },
                decoration: InputDecoration(
                  hintText: 'Type something',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
