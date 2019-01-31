class RouteData {
  final List<Route> routes;

  RouteData({this.routes});

  factory RouteData.fromJson(Map<String, dynamic> json) {
    var routesFromJson = json['routes'] as List;

    List<Route> routesList = routesFromJson.map((i) => 
    Route.fromJson(i)).toList();

    return RouteData(
        routes: routesList);
  }
}

class Route {
  final int id;
  final String number;
  final String name;
  final String colour;
  final String colourInverse;
  final List<RouteCoordinates> routeCoordinates;
  final bool active;

  Route(
      {this.id,
      this.number,
      this.name,
      this.colour,
      this.colourInverse,
      this.routeCoordinates,
      this.active});

  factory Route.fromJson(Map<String, dynamic> json) {

    var routeCoordinatesFromJson = json['RouteCoordinates'] as List;

    List<RouteCoordinates> routeCoordinatesList = routeCoordinatesFromJson.map((i) => 
    RouteCoordinates.fromJson(i)).toList();

    return Route(
      id: json['Id'],
      number: json['Number'],
      name: json['Name'],
      colour: json['Colour'],
      colourInverse: json['ColourInverse'],
      routeCoordinates: routeCoordinatesList,
      active: json['Active'],
    );
  }
}

class RouteCoordinates {
  final double lat;
  final double lon;
  final bool isVital;
  final bool occasional;
  final String direction;
  final dynamic splitSection;

  RouteCoordinates(
      {this.lat,
      this.lon,
      this.isVital,
      this.occasional,
      this.direction,
      this.splitSection});

  factory RouteCoordinates.fromJson(Map<String, dynamic> json) {
    return RouteCoordinates(
      lat: json['lat'],
      lon: json['lon'],
      isVital: json['isVital'],
      occasional: json['occasional'],
      direction: json['direction'],
      splitSection: json['splitSection'],
    );
  }

}