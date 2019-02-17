import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/reducers/selected_routes_reducer.dart';
import 'package:bus_tracker/reducers/tabs_reducer.dart';
import 'package:bus_tracker/reducers/settings_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
      selectedRoutes: selectedRouteReducer(state.selectedRoutes, action),
      activeTab: tabsReducer(state.activeTab, action),
      settings: settingsReducer(state.settings, action));
}

