import 'package:bus_tracker/models/models.dart';
import 'package:flutter/foundation.dart';

class AppState {
  final List<SelectedRoute> selectedRoutes;
  final AppTab activeTab;

  AppState({@required this.selectedRoutes, this.activeTab = AppTab.map});

  AppState.initialState()
      : selectedRoutes = List.unmodifiable(<SelectedRoute>[]),
        activeTab = AppTab.map;

  AppState.fromJson(Map json)
      : selectedRoutes = (json['selectedRoutes'] as List)
            .map((i) => SelectedRoute.fromJson(i))
            .toList(),
        activeTab = json['activeTab'];

  Map toJson() => {'selectedRoutes': selectedRoutes};
}
