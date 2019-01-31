import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchData {
  Future<BusData> fetchPost() async {
    final response = await http.get(
        'https://sojbuslivetimespublic.azurewebsites.net/api/Values/GetMin?secondsAgo=3600');

    if (response.statusCode == 200) {
      return BusData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get bus data');
    }
    
  }
}

class BusData {
  final String bus;
  final String line;
  final String cat;
  final int lat;
  final int lon;
  final int bearing;
  final String direction;
  final String time;
  final int age;

  BusData(
      {this.bus,
      this.line,
      this.cat,
      this.lat,
      this.lon,
      this.bearing,
      this.direction,
      this.time,
      this.age});

  factory BusData.fromJson(Map<String, dynamic> json) {
    return BusData(
      bus: json['bus'],
      line: json['line'],
      cat: json['cat'],
      lat: json['lat'],
      lon: json['lon'],
      bearing: json['bearing'],
      direction: json['direction'],
      time: json['time'],
      age: json['age'],
    );
  }
}
