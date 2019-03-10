import 'package:flutter/material.dart';
import 'package:track_my_travel/presentation/pages/select_routes_page.dart';

class MapPageOptionsWidget extends StatefulWidget {
  @override
  _MapPageOptionsWidgetState createState() => _MapPageOptionsWidgetState();
}

class _MapPageOptionsWidgetState extends State<MapPageOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: "routesButton",
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SelectRoutesPage()));
          },
          child: Icon(
            Icons.directions,
            color: Colors.lightBlue,
          ),
          backgroundColor: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          heroTag: "stopsButton",
          onPressed: () => {},
          child: Icon(
            Icons.stop,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
        )
      ],
    );
  }
}
