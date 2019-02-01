class BusData {
  final List<MinimumInfoUpdate> minimumInfoUpdates;
  final List<dynamic> stops;

  BusData({this.minimumInfoUpdates, this.stops});

  factory BusData.fromJson(Map<String, dynamic> json) {
    var minimumInfoUpdatesFromJson = json['minimumInfoUpdates'] as List;

    List<MinimumInfoUpdate> minimumInfoUpdatesList = minimumInfoUpdatesFromJson.map((i) => 
    MinimumInfoUpdate.fromJson(i)).toList();

    return BusData(
        minimumInfoUpdates: minimumInfoUpdatesList, stops: json['stops']);
  }
}


class MinimumInfoUpdate {
  final String bus;
  final String line;
  final String cat;
  final double lat;
  final double lon;
  final int bearing;
  final String direction;
  final String time;
  final int age;

  MinimumInfoUpdate(
      {this.bus,
      this.line,
      this.cat,
      this.lat,
      this.lon,
      this.bearing,
      this.direction,
      this.time,
      this.age});

  factory MinimumInfoUpdate.fromJson(Map<String, dynamic> json) {
    return MinimumInfoUpdate(
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