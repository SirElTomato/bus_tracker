import 'package:bus_tracker/models/app_state.dart';
import 'package:bus_tracker/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
      selectedRoutes: selectedRouteReducer(state.selectedRoutes, action));
}

List<SelectedRoute> selectedRouteReducer(List<SelectedRoute> state, action) {
  if (action is AddSelectedRouteAction) {
    return []
      ..addAll(state)
      ..add(SelectedRoute(name: action.routeName));
  }

  if (action is RemoveSelectedRouteAction) {
    return List.unmodifiable(List.from(state)..remove(action.routeName));
  }

  if (action is RemoveAllSelectedRoutesAction) {
    return List.unmodifiable([]);
  }

  if (action is LoadedSelectedRoutesAction) {
    return action.selectedRoutes;
  }

  return state;
}
