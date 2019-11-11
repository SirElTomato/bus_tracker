import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:track_my_travel/data/models/bus_data/bus_data.dart';
import 'package:track_my_travel/data/models/serializers/serializers.dart';

class BusDataSource {
  final http.Client client;
  final String searchBaseUrl =
      "http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetMin";

  BusDataSource(this.client);

  Future<BusData> getBusData([double lat, double lon]) async {
    String url;
    if (lat != null && lon != null) {
      url = searchBaseUrl + "?lat=$lat&lon=$lon";
    } else {
      url = searchBaseUrl;
    }

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      BusData busData = serializers.deserializeWith(BusData.serializer, parsed);
      return busData;
    } else {
      throw Exception(json.decode(response.body)['error']['message']);
    }
  }
}
