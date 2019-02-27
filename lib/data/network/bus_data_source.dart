import 'dart:async';
import 'dart:convert';

import 'package:bus_tracker/data/models/data_models.dart';
import 'package:http/http.dart' as http;

class BusDataSource {
  final http.Client client;
  final String searchBaseUrl =
      "http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetMin";

  BusDataSource(this.client);

  Future<BusData> getBusData() async {
    final response = await client.get(searchBaseUrl);

    if (response.statusCode == 200) {
      return BusData.fromJson(response.body);
    } else {
      throw Exception(json.decode(response.body)['error']['message']);
    }
  }
}
