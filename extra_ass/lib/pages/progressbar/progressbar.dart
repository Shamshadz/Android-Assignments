import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double _progressValue = 0;

  Future<void> slowLoop() async {
    while (_progressValue < 1.0) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        _progressValue += 0.1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linear Progress Bar Demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: LinearProgressIndicator(
            value: _progressValue,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            backgroundColor: Colors.grey[200],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          slowLoop();
          setState(() {
            _progressValue = 0;
          });
        },
        child: Icon(Icons.start),
      ),
    );
  }
}
