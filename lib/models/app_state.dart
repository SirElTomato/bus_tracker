import 'package:flutter/foundation.dart';

class AppState {
  final List<SelectedRoute> selectedRoutes;

  AppState({@required this.selectedRoutes});

  AppState.initialState()
      : selectedRoutes = List.unmodifiable(<SelectedRoute>[]);

  AppState.fromJson(Map json)
      : selectedRoutes = (json['selectedRoutes'] as List)
            .map((i) => SelectedRoute.fromJson(i))
            .toList();

  Map toJson() => {'selectedRoutes': selectedRoutes};
}

class SelectedRoute {
  final String name;

  SelectedRoute({@required this.name});

  SelectedRoute copyWith({String name}) {
    return SelectedRoute(name: name ?? this.name);
  }

  SelectedRoute.fromJson(Map json) : name = json['name'];

  Map toJson() => {
        'name': name,
      };
}
