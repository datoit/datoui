import 'package:flutter/material.dart';
import 'package:datoit/datoit.dart';
import 'package:dio/dio.dart';

class DtHome extends StatefulWidget {
  static const String routeName = '/mainhome';
  @override
  State<DtHome> createState() => DtHomeState();
}

class DtHomeState extends State<DtHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ? Color(0xFFF8F8F9) : Color(0xFF323135),
      appBar: AppBar(
        title: Text("DATOIT"),
        centerTitle: true,
      ),
      body: FLDyContainer(
        jsonObject: null,
        jsonUrl: 'https://flui.datoit.com/api/dynamic/demo/json',
        placeholder: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      ),
    );
  }
}
