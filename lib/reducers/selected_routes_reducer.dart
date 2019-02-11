import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/redux/actions.dart';

List<SelectedRoute> selectedRouteReducer(List<SelectedRoute> state, action) {
  if (action is AddSelectedRouteAction) {
    return []
      ..addAll(state)
      ..add(action.selectedRoute);
  }

  if (action is RemoveSelectedRouteAction) {
    return List.unmodifiable(List.from(state)..remove(action.selectedRoute));
  }

  if (action is RemoveAllSelectedRoutesAction) {
    return List.unmodifiable([]);
  }

  if (action is LoadedSelectedRoutesAction) {
    return action.selectedRoutes;
  }

  return state;
}