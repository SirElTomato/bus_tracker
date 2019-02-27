import 'dart:io';

import 'package:bus_tracker/data/models/bus_data.dart';
import 'package:bus_tracker/data/network/bus_data_source.dart';
import 'package:bus_tracker/data/repositories/bus_data_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBusDataSource extends Mock implements BusDataSource {}

void main() {
  BusDataRepository repository;
  MockBusDataSource mockDataSource;

  String fixture(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();

  setUp(() {
    mockDataSource = MockBusDataSource();
    repository = BusDataRepository(mockDataSource);
  });

  group('getData', () {
    BusData busData;

    setUp(() {
      busData = BusData.fromJson(fixture('bus_data'));
    });

    group('getMinimumInfoUpdates', () {
      test(
        'returns a List<MinimumInfoUpdate>',
        () async {
          when(mockDataSource.getBusData()).thenAnswer((_) async => busData);

          final minimumInfoUpdates = await repository.getMinimumInfoUpdates();

          expect(minimumInfoUpdates, busData.minimumInfoUpdates);
        },
      );
    });
  });
}
