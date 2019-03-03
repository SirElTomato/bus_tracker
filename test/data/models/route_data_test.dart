import 'dart:convert';

import 'package:test/test.dart';
import 'package:track_my_travel/data/models/route_data/bus_route.dart';
import 'package:track_my_travel/data/models/route_data/route_coordinates.dart';
import 'package:track_my_travel/data/models/route_data/route_data.dart';
import 'package:track_my_travel/data/models/serializers/serializers.dart';

void main() {
  test("parse route_data json", () {
    //http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetRoutes
    final jsonString = """
    {"routes":[{"Id":1,"Number":"1","Name":"Gorey Pier","Colour":"#302F84","ColourInverse":"#FFFFFF",
    "RouteCoordinates":[{"lat":49.183322,"lon":-2.1095108,"isVital":true,"occasional":false,"direction":"O","splitSection":null}],"Active":true}]}
    """;

    RouteData routeData = RouteData.fromJson(jsonString);

    expect(routeData.routes.first.Id, 1);
  });

  test("parse bus_route json", () {
    //http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetRoutes
    // String jsonString = File('test/data/route_data.json').readAsStringSync();
    final jsonString = """
    {"Id":1,"Number":"1","Name":"Gorey Pier","Colour":"#302F84","ColourInverse":"#FFFFFF",
    "RouteCoordinates":[{"lat":49.183322,"lon":-2.1095108,"isVital":true,"occasional":false,"direction":"O","splitSection":null}],"Active":true}
    """;

    BusRoute busRoute = BusRoute.fromJson(jsonString);

    expect(busRoute.Id, 1);
  });

  test("parse route_coordinates json", () {
    //http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetRoutes
    // String jsonString = File('test/data/route_data.json').readAsStringSync();
    final jsonString = """
    {"lat":49.183322,"lon":-2.1095108,"isVital":true,"occasional":false,"direction":"O","splitSection":null}
    """;

    RouteCoordinates routeCoordinates = RouteCoordinates.fromJson(jsonString);

    expect(routeCoordinates.lat, 49.183322);
  });
}
