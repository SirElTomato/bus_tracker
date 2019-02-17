import 'package:bus_tracker/models/models.dart';

class Settings {
  int busMarkerIconSize;

  Settings({this.busMarkerIconSize = IconSize.small});

  Settings copyWith({int busMarkerIconSize}) {
    return Settings(
        busMarkerIconSize: busMarkerIconSize ?? this.busMarkerIconSize);
  }

  Settings.fromJson(Map json) : busMarkerIconSize = json['busMarkerIconSize'];

  Map toJson() => {
        'busMarkerIconSize': busMarkerIconSize,
      };
}
