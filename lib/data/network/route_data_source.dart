import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:track_my_travel/data/models/route_data/route_data.dart';
import 'package:track_my_travel/data/models/serializers/serializers.dart';

class RouteDataSource {
  final http.Client client;
  final String searchBaseUrl =
      "http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetRoutes";

  RouteDataSource(this.client);

  Future<RouteData> getRouteData() async {
    final response = await client.get(searchBaseUrl);

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      RouteData routeData =
          serializers.deserializeWith(RouteData.serializer, parsed);
      return routeData;
    } else {
      throw Exception(json.decode(response.body)['error']['message']);
    }
  }
}
