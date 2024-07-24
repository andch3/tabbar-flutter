import 'package:flutter/material.dart';

import '/hal_computer.dart' as computer;
import '/hal_headset.dart' as headset;
import '/hal_radio.dart' as radio;
import '/hal_smartphone.dart' as smartphone;

void main() {
  runApp(MaterialApp(
    title: "Tab Bar",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Daftar Elektronik"),
          bottom: TabBar(
            controller: controller,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.computer),text: "Computer",),
              Tab(icon: Icon(Icons.headset),text: "Headset",),
              Tab(icon: Icon(Icons.radio),text: "Radio",),
              Tab(icon: Icon(Icons.smartphone),text: "Smartphone",),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            computer.Computer(),
            headset.Headset(),
            radio.Radio(),
            smartphone.Smartphone(),
          ],
        ),
        
      bottomNavigationBar: Material(
        color: Colors.amber,
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.computer),),
            Tab(icon: Icon(Icons.headset),),
            Tab(icon: Icon(Icons.radio),),
            Tab(icon: Icon(Icons.smartphone),),
          ],
        ),
      ),
    );
  }
}
