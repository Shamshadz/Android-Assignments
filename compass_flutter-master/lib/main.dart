import 'package:compassapp/compasswidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasPermissions = false;

  @override
  void initState() {
    super.initState();

    _fetchPermissionStatus();
  }

  void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() {
          _hasPermissions = (status == PermissionStatus.granted);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white70,
          body: Builder(builder: (context) {
        if (_hasPermissions) {
          return _buildComp();
        } else {
          return _buildPermissionSheet();
        }
      })),
    );
  }

  // compass widget
  Widget _buildComp() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        // error msg
        if (snapshot.hasError) {
          return Text("Error reading heading: ${snapshot.error}");
        }

      //  loading
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
            child: CircularProgressIndicator()
        );
      }

      double? direction =  snapshot.data!.heading;

    //  if direction is null, then device does not support this sensor
        if(direction == null) {
          return const Center(
            child: Text("Device does not have sensors"),
          );
        }

        return CompassWidget(
          child: Center(
            child: Container(
             padding: EdgeInsets.all(25),
             child: Transform.rotate(
               angle: direction * (math.pi / 180) * -1,
               child: Image.asset(
                 "lib/images/compass.png",
               ),
             )
            )
          ),
        );
    }
    );
  }

  // permission sheet widget
  Widget _buildPermissionSheet() {
    return Center(
        child: ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
          ),
      onPressed: () {
        Permission.locationWhenInUse.request().then((value) {
          _fetchPermissionStatus();
        });
      },
      child: Text("Request Permission",
        style: TextStyle(
          fontSize: 14,
          fontFamily: GoogleFonts.lato().fontFamily
        ),
      ),
    ));
  }
}
