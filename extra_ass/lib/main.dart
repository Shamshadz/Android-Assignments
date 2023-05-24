import 'package:flutter/material.dart';
import 'package:extra_ass/list_wid.dart';
import 'package:extra_ass/pages/add2num/add2num.dart';
import 'package:extra_ass/pages/signal/signal.dart';
import 'package:extra_ass/pages/unitconv/unitconv.dart';
import 'package:extra_ass/pages/toggleimg/toggleimg.dart';
import 'package:extra_ass/pages/autocomplete/autocomplete.dart';
import 'package:extra_ass/pages/progressbar/progressbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Extra'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<dynamic> pages = [
    {'title': 'Add Two Number', 'page': Add2Num()},
    {'title': 'Signal using radio Button', 'page': Signal()},
    {'title': 'Unit Converter', 'page': UnitConverter()},
    {'title': 'Toggle Image', 'page': ImageToggleButton()},
    {'title': 'Auto Complete TextView', 'page': AutoCplView()},
    {'title': 'Linear Progress Bar', 'page': ProgressBar()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return ListWidget(
              page: pages[index],
            );
          },
        ),
      ),
    );
  }
}
