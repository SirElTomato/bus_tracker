import 'dart:convert';

import 'package:test/test.dart';
import 'package:track_my_travel/data/models/route_data/route_data.dart';
import 'package:track_my_travel/data/models/serializers/serializers.dart';
import 'package:track_my_travel/data/network/route_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:track_my_travel/data/respository/route_data_repository.dart';

class MockRouteDataSource extends Mock implements RouteDataSource {}

void main() {
  RouteDataRepository repository;
  MockRouteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockRouteDataSource();
    repository = RouteDataRepository(mockDataSource);
  });

  test("get route data from repository", () async {
    //http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetMin?lat=49.218360&lon=-2.139824
    final jsonString = """
    {"routes":[{"Id":1,"Number":"1","Name":"Gorey Pier","Colour":"#302F84","ColourInverse":"#FFFFFF",
    "RouteCoordinates":[{"lat":49.183322,"lon":-2.1095108,"isVital":true,"occasional":false,"direction":"O","splitSection":null}],"Active":true}]}
    """;

    final parsed = jsonDecode(jsonString);
    RouteData mockRouteData =
        serializers.deserializeWith(RouteData.serializer, parsed);

    when(mockDataSource.getRouteData()).thenAnswer((_) async => mockRouteData);

    RouteData routeData = await repository.getRouteData();

    expect(routeData, mockRouteData);
  });
}
