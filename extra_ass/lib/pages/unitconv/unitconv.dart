import 'package:flutter/material.dart';

class UnitConverter extends StatefulWidget {
  const UnitConverter({super.key});

  @override
  State<UnitConverter> createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  double _kilogram = 0;
  double _kilo = 0;

  void _convert() {
    setState(() {
      _kilo = _kilogram * 1000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UNIT CONVERTER")),
      body: Container(
        padding: EdgeInsets.all(33.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter value in kilograms',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _kilogram = double.parse(value);
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Convert'),
              onPressed: _convert,
            ),
            SizedBox(height: 16.0),
            Text(
              '$_kilogram kilograms is equal to $_kilo kilos',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
