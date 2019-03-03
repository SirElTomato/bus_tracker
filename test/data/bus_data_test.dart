import 'dart:convert';

import 'package:test/test.dart';
import 'package:track_my_travel/data/models/bus_data/bus_data.dart';
import 'package:track_my_travel/data/models/bus_data/bus_stop.dart';
import 'package:track_my_travel/data/models/bus_data/minimum_info_update.dart';
import 'package:track_my_travel/data/models/serializers/serializers.dart';

void main() {
  test("parse bus_data json", () {
    //http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetMin?lat=49.218360&lon=-2.139824
    const jsonString =
        """{"minimumInfoUpdates":[{"bus":"bus-1-1900-1715","line":"1","cat":"Public Bus","lat":49.1674630,"lon":-2.0652280,"bearing":268,"direction":"inbound","time":"19:49:36","age":82},{"bus":"bus-1-1905-1718","line":"1","cat":"Public Bus","lat":49.1837300,"lon":-2.1110380,"bearing":323,"direction":"outbound","time":"19:44:46","age":372},{"bus":"bus-1-1920-1705","line":"1","cat":"Public Bus","lat":49.1997310,"lon":-2.0212240,"bearing":81,"direction":"outbound","time":"19:50:16","age":42},{"bus":"bus-15-0900-2603","line":"15","cat":"Public Bus","lat":49.1831050,"lon":-2.1090860,"bearing":0,"direction":"inbound","time":"19:36:18","age":880},{"bus":"bus-15-1610-2604","line":"15","cat":"Public Bus","lat":49.1842850,"lon":-2.1808710,"bearing":99,"direction":"inbound","time":"19:50:42","age":16},{"bus":"bus-15-1935-2601","line":"15","cat":"Public Bus","lat":49.1921280,"lon":-2.1668950,"bearing":217,"direction":"outbound","time":"19:50:08","age":50},{"bus":"bus-16-1820-1724","line":"7","cat":"Public Bus","lat":49.2043160,"lon":-2.1405900,"bearing":127,"direction":"inbound","time":"19:50:26","age":32},{"bus":"bus-23-1700-1708","line":"3","cat":"Public Bus","lat":49.1837560,"lon":-2.1101610,"bearing":305,"direction":"inbound","time":"19:49:47","age":71},{"bus":"bus-3-1625-1709","line":"16","cat":"Public Bus","lat":49.1837860,"lon":-2.1100610,"bearing":89,"direction":"outbound","time":"19:45:46","age":312},{"bus":"bus-3-1915-1723","line":"3","cat":"Public Bus","lat":49.2082400,"lon":-2.0660150,"bearing":226,"direction":"inbound","time":"19:50:45","age":13},{"bus":"bus-9-1945-1701","line":"9","cat":"Public Bus","lat":49.1932560,"lon":-2.1255060,"bearing":298,"direction":"outbound","time":"19:50:38","age":20}],"stops":[{"StopNumber":3893,"StopName":"Three Oaks","Latitude":49.2183600,"Longitude":-2.1402700,"DistanceAwayInMetres":32},{"StopNumber":3894,"StopName":"Three Oaks","Latitude":49.2192600,"Longitude":-2.1404900,"DistanceAwayInMetres":111},{"StopNumber":4367,"StopName":"Hamptonne Museum","Latitude":49.2218100,"Longitude":-2.1417500,"DistanceAwayInMetres":408},{"StopNumber":3523,"StopName":"Oxenford Close","Latitude":49.2225800,"Longitude":-2.1421000,"DistanceAwayInMetres":497}]}""";

    final parsed = jsonDecode(jsonString);
    BusData busData = serializers.deserializeWith(BusData.serializer, parsed);

    expect(busData.minimumInfoUpdates.first.bus, "bus-1-1900-1715");
  });

  test("parse minimum_info_update json", () {
    //http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetMin?lat=49.218360&lon=-2.139824
    const jsonString =
        """{"bus":"bus-1-1900-1715","line":"1","cat":"Public Bus","lat":49.1674630,"lon":-2.0652280,"bearing":268,"direction":"inbound","time":"19:49:36","age":82}""";

    final parsed = jsonDecode(jsonString);
    MinimumInfoUpdate minimumInfoUpdate =
        serializers.deserializeWith(MinimumInfoUpdate.serializer, parsed);

    expect(minimumInfoUpdate.bus, "bus-1-1900-1715");
  });

  test("parse bus_stop json", () {
    //http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetMin?lat=49.218360&lon=-2.139824
    const jsonString =
        """{"StopNumber":3893,"StopName":"Three Oaks","Latitude":49.2183600,"Longitude":-2.1402700,"DistanceAwayInMetres":32}""";

    final parsed = jsonDecode(jsonString);
    BusStop busStop = serializers.deserializeWith(BusStop.serializer, parsed);

    expect(busStop.StopNumber, 3893);
  });
}
