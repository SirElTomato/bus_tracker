import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'bus_data.dart';
import 'select_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Island Mapper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Island Mapper'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  GoogleMapController mapController;
  BusData _busData;



  @override
  Widget build(BuildContext context) {
    fetchBusData(); //TODO: Put this on a timer?

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.list), onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SelectRoutesPage()));
                })
          ],
        ),
        body: Center(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
          ),
        ));
  }

  // bus data
  void fetchBusData() async {
    final response = await http.get(
        'https://sojbuslivetimespublic.azurewebsites.net/api/Values/GetMin?secondsAgo=3600');
    if (response.statusCode == 200) {
      BusData busData = BusData.fromJson(json.decode(response.body));
      _busData = busData;
    } else {
      throw Exception('Failed to get bus data');
    }
  }

  // map stuff
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

 

  // void _selectRoutesPage() {
  //   fetchRouteData();
  //   Navigator.of(context).push(
  //     new MaterialPageRoute<void>(
  //       builder: (BuildContext context) {
  //         return new Scaffold(
  //             appBar: new AppBar(
  //               title: const Text('Select Routes'),
  //             ),
  //             body: _buildRouteSelector());
  //       },
  //     ),
  //   );
  // }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}












// class RouteSelectorWidget extends StatefulWidget {
//   @override
//   _RouteSelectorWidgetState createState() => _RouteSelectorWidgetState();
// }

// class _RouteSelectorWidgetState extends State<RouteSelectorWidget> {
//   bool _isSelected = true;
//   final Set<String> _selectedRoutes = new Set<String>();

//   @override
//   Widget build(BuildContext context) {
//     return InkResponse(
//             enableFeedback: true,
//             onTap: () => _handleRouteClicked(),
//             // onLongPress: , TODO: show route on map
//             child: Opacity(
//               opacity: _isSelected ? 1 : 0.2,
//               child: Container(
//                 child: Center(
//                     child: Text(routeName,
//                         style: TextStyle(color: Colors.white, fontSize: 24))),
//                 // color: Colors.red
//                 width: width,
//                 height: height,
//                 margin: new EdgeInsets.fromLTRB(20, 20, 15, 0),
//                 decoration: new BoxDecoration(
//                     color: HexColor(colorInHex),
//                     borderRadius: BorderRadius.all(const Radius.circular(50))),
//               ),
//             ));
//   }

//   GridTile _createRouteSelectorWidget(
//       String routeName, String colorInHex, double width, double height) {
//     final bool selected = _selectedRoutes.contains(routeName);
//     double opacity = selected ? 1.0 : 0.2;

//     return new GridTile(
//       child: RouteSelectorWidget(
//       ),
//     );

//     return new GridTile(
//         child: InkResponse(
//             enableFeedback: true,
//             onTap: () => _handleRouteClicked(routeName, selected),
//             // onLongPress: , TODO: show route on map
//             child: Opacity(
//               opacity: opacity,
//               child: Container(
//                 child: Center(
//                     child: Text(routeName,
//                         style: TextStyle(color: Colors.white, fontSize: 24))),
//                 // color: Colors.red
//                 width: width,
//                 height: height,
//                 margin: new EdgeInsets.fromLTRB(20, 20, 15, 0),
//                 decoration: new BoxDecoration(
//                     color: HexColor(colorInHex),
//                     borderRadius: BorderRadius.all(const Radius.circular(50))),
//               ),
//             )));
//   }

//   void _handleRouteClicked(String route, bool selected) {
//     setState(() {
//       if (selected) {
//        _isSelected = false;
//         _selectedRoutes.remove(route);
//       } else {
//        _isSelected = true;
//         _selectedRoutes.add(route);
//       }
//     });
//   }

// }
