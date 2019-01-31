import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Jersey Bus Tracker'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.list), onPressed: _selectRoutes)
          ],
        ),
        body: Center(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
          ),
        ));
  }

  Future<BusData> fetchPost() async {
    final response = await http.get(
        'https://sojbuslivetimespublic.azurewebsites.net/api/Values/GetMin?secondsAgo=3600');

    if (response.statusCode == 200) {
      BusData busData = BusData.fromJson(json.decode(response.body));
      return busData;
    } else {
      throw Exception('Failed to get bus data');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _selectRoutes() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        // Add 20 lines from here...
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Select Routes'),
            ),
            body: new Center(
              child: FutureBuilder<BusData>(
                future: fetchPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var text = snapshot.data.minimumInfoUpdates[0].toString();
                    return Text(text);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // // By default, show a loading spinner
                  // return CircularProgressIndicator();
                  return Text('hello');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   Future<BusData> fetchPost() async {
//     final response = await http.get(
//         'https://sojbuslivetimespublic.azurewebsites.net/api/Values/GetMin?secondsAgo=3600');

//     if (response.statusCode == 200) {
//       BusData busData = BusData.fromJson(json.decode(response.body));
//       return busData;
//     } else {
//       throw Exception('Failed to get bus data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: FutureBuilder<BusData>(
//           future: fetchPost(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               var text = snapshot.data.minimumInfoUpdates[0].toString();
//               return Text(text);
//             } else if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             }

//             // // By default, show a loading spinner
//             // return CircularProgressIndicator();
//             return Text('hello');
//           },
//         ),
//       ),

//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// class FetchData {}

class BusData {
  final List<dynamic> minimumInfoUpdates;
  final List<dynamic> stops;

  BusData({this.minimumInfoUpdates, this.stops});

  factory BusData.fromJson(Map<String, dynamic> json) {
    return BusData(
        minimumInfoUpdates: json['minimumInfoUpdates'], stops: json['stops']);
  }
}

// class MinimumInfoUpdate {
//   final String bus;
//   final String line;
//   final String cat;
//   final int lat;
//   final int lon;
//   final int bearing;
//   final String direction;
//   final String time;
//   final int age;

//   MinimumInfoUpdate(
//       {this.bus,
//       this.line,
//       this.cat,
//       this.lat,
//       this.lon,
//       this.bearing,
//       this.direction,
//       this.time,
//       this.age});

//   // factory MinimumInfoUpdate.fromJson(Map<String, dynamic> json) {
//   //   return MinimumInfoUpdate(
//   //     bus: json['bus'],
//   //     line: json['line'],
//   //     cat: json['cat'],
//   //     lat: json['lat'],
//   //     lon: json['lon'],
//   //     bearing: json['bearing'],
//   //     direction: json['direction'],
//   //     time: json['time'],
//   //     age: json['age'],
//   //   );
//   // }
// }
