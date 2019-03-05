import 'package:flutter/material.dart';
import 'package:track_my_travel/presentation/widgets/map_page_options_widget.dart';
import 'package:track_my_travel/presentation/widgets/map_widget.dart';

class MapPage extends StatefulWidget {
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Text(
      //     'Track my Travel',
      //   ),
      // ),
      drawer: Drawer(),
      floatingActionButton: MapPageOptionsWidget(),
      body: Center(
        child: MapWidget(),
      ),
    );
  }
}
