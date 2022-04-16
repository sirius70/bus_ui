import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Attenance'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
