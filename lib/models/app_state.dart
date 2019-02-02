import 'package:flutter/foundation.dart';

class AppState {
  final List<SelectedRoute> selectedRoutes;

  AppState({@required this.selectedRoutes});

  AppState.initialState() : selectedRoutes = List.unmodifiable(<SelectedRoute>[]);
}




class SelectedRoute {
  final String name;

  SelectedRoute({@required this.name});

  SelectedRoute copyWith({String name}) {
    return SelectedRoute(
        name: name ?? this.name);
  }
}
