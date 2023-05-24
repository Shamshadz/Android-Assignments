import 'package:flutter/material.dart';

class ImageToggleButton extends StatefulWidget {
  @override
  _ImageToggleButtonState createState() => _ImageToggleButtonState();
}

class _ImageToggleButtonState extends State<ImageToggleButton> {
  bool _isImageVisible = false;

  void _toggleImageVisibility(int index) {
    setState(() {
      _isImageVisible = !_isImageVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toggle Image"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            if (_isImageVisible)
              Container(
                height: 300,
                width: 300,
                padding: EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/happy.png',
                  fit: BoxFit.cover,
                ),
              ),
            if (!_isImageVisible)
              Container(
                height: 300,
                width: 300,
                padding: EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/sad.png',
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(
              height: 20,
            ),
            ToggleButtons(
              onPressed: _toggleImageVisibility,
              isSelected: [_isImageVisible],
              children: [
                Icon(
                  Icons.radio_button_checked_outlined,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
