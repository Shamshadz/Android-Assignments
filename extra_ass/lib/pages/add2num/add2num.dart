import 'package:flutter/material.dart';

class Add2Num extends StatefulWidget {
  const Add2Num({super.key});

  @override
  State<Add2Num> createState() => _Add2NumState();
}

class _Add2NumState extends State<Add2Num> {
  final _formKey = GlobalKey<FormState>();
  int _number1 = 0;
  int _number2 = 0;
  int sum = 0;
  bool result = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Number 1: $_number1');
      print('Number 2: $_number2');
      FocusScope.of(context).unfocus();
      setState(() {
        sum = _number1 + _number2;
        result = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Two Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Number 1'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a number';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                        onSaved: (value) => _number1 = int.parse(value!),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Number 2'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a number';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                        onSaved: (value) => _number2 = int.parse(value!),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('Add'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 76,
                ),
                Text(
                  !result ? "Result" : sum.toString(),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
