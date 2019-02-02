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
      ..add(SelectedRoute(name: action.route.name));
  } 
  
  if (action is RemoveSelectedRouteAction) {
    return List.unmodifiable(List.from(state)..remove(action.route));
  }

  if (action is RemoveAllSelectedRoutesAction) {
    return List.unmodifiable([]);
  }

  return state;
}

// List<SelectedRoute> appReducers(List<SelectedRoute> routes, dynamic action) {
//   if (action is AddSelectedRouteAction) {
//     return addRoute(routes, action);
//   } else if (action is RemoveSelectedRouteAction) {
//     return removeRoute(routes, action);
//   }
//   return routes;
// }

// List<SelectedRoute> addRoute(
//     List<SelectedRoute> routes, AddSelectedRouteAction action) {
//   return List.from(routes)..add(action.route);
// }

// List<SelectedRoute> removeRoute(
//     List<SelectedRoute> routes, RemoveSelectedRouteAction action) {
//   return List.from(routes)..add(action.route);
// }
