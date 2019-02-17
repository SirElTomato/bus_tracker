import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/models/settings.dart';
import 'package:flutter/foundation.dart';

class AppState {
  final List<SelectedRoute> selectedRoutes;
  final AppTab activeTab;
  final Settings settings;

  AppState({@required this.selectedRoutes, this.activeTab = AppTab.map, this.settings});

  AppState.initialState()
      : selectedRoutes = List.unmodifiable(<SelectedRoute>[]),
        activeTab = AppTab.map,
        settings = new Settings();

  AppState.fromJson(Map json)
      : selectedRoutes = (json['selectedRoutes'] as List)
            .map((i) => SelectedRoute.fromJson(i))
            .toList(),
        activeTab = json['activeTab'],
        settings = Settings.fromJson(json['settings']);

  Map toJson() => {'selectedRoutes': selectedRoutes,'settings': settings};
}
