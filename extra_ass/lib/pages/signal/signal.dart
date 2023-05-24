import 'package:flutter/material.dart';

class Signal extends StatefulWidget {
  const Signal({super.key});

  @override
  State<Signal> createState() => _SignalState();
}

class _SignalState extends State<Signal> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signal Light")),
      body: Column(
        children: [
          RadioListTile(
            value: true,
            groupValue: _isSelected,
            onChanged: (bool? value) {
              setState(() {
                _isSelected = value!;
              });
            },
            title: Text('GO'),
          ),
          RadioListTile(
            value: false,
            groupValue: _isSelected,
            onChanged: (bool? value) {
              setState(() {
                _isSelected = value!;
              });
            },
            title: Text('Stop'),
          ),
          Container(
            height: 200,
            width: 200,
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              _isSelected ? 'assets/images/go.png' : 'assets/images/stop.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
