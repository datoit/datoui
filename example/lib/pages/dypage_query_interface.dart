import 'package:flutter/material.dart';
import 'package:datoit/datoit.dart';

class DyQueryInterface extends StatefulWidget {
  static const String routeName = '/query-interface';
  @override
  State<DyQueryInterface> createState() => DyQueryInterfaceState();
}

class DyQueryInterfaceState extends State<DyQueryInterface> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ? Color(0xFFF8F8F9) : Color(0xFF323135),
      appBar: AppBar(
        title: Text("Query Interface"),
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