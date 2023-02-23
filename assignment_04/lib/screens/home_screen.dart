import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Fragments"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(
              text: "Home",
            ),
            Tab(
              text: "DashBoard",
            ),
            Tab(
              text: "About",
            )
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: const [
        Text("Home"),
        Text("DashBoard"),
        Text("About"),
      ]),
    );
  }
}
