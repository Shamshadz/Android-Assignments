import 'package:asssignment6/Profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'global.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RegistrationForm(),
  ));
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool agreedToTerms = false;

  var department = [
    'Computer Science',
    'Information Technology',
    'Electronics',
    'Electrical',
    'Mechanical',
    'Civil',
  ];

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Registration Page",
            style: TextStyle(color: Colors.black, fontSize: 23),
            textAlign: TextAlign.center,
          )),
          backgroundColor: Colors.white,
          elevation: 0.2,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 200,
                  width: 600,
                  child: Image.asset("assets/images/download.png")),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                ),
                controller: myController,
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    "Select gender",
                    style: TextStyle(fontSize: 18),
                  ),
                  RadioListTile(
                    title: Text("Male"),
                    value: "male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Female"),
                    value: "female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: TextField(
                    controller: dateInput,
                    //editing controller of this TextField
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Enter Date" //label text of field
                        ),
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          dateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                  ))),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    focusColor: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    dropdownColor: Colors.white,
                    iconSize: 36,
                    isExpanded: false,
                    style: const TextStyle(color: Colors.black, fontSize: 22),
                    hint: const Text("Select Department"),
                    value: selectedDepartment,
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.black, size: 27),
                    items: department.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (var newValue) {
                      setState(() {
                        selectedDepartment = newValue!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FormField(
                initialValue: false,
                validator: (value) {
                  if (value == false) {
                    return 'You must agree to the terms of service.';
                  }
                  return null;
                },
                builder: (FormFieldState formFieldState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: agreedToTerms,
                            onChanged: (value) {
                              formFieldState.didChange(value);
                              setState(() {
                                agreedToTerms = value!;
                              });
                            },
                          ),
                          Text(
                            'I agree to the terms of service.',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      if (!formFieldState.isValid)
                        Text(
                          formFieldState.errorText ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.error),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(20)),
                child: OutlinedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    setState(() {
                      name = myController.text;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ));
  }
}
