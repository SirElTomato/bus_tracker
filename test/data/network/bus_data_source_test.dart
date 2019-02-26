import 'dart:io';
import 'package:bus_tracker/data/network/bus_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:bus_tracker/data/models/data_models.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  String fixture(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();

  MockClient mockClient;
  BusDataSource dataSource;

  setUp(() {
    mockClient = MockClient();
    dataSource = BusDataSource(mockClient);
  });

  group('getData', () {
    test('returns bus data', () async {
      when(
        mockClient.get(
          argThat(
            startsWith(
                'http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetMin'),
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(
              fixture('bus_data'),
              200,
              headers: {'content-type': 'application/json'},
            ),
      );

      BusData result = await dataSource.getBusData();

      expect(result, TypeMatcher<BusData>());
    });
  });
}
