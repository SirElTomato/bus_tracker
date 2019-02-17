import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/redux/actions.dart';
import 'package:redux/redux.dart';

final settingsReducer = combineReducers<Settings>([
  TypedReducer<Settings, UpdateBusMarkerIconSize>(busMarkerIconSizeReducer),
]);


Settings busMarkerIconSizeReducer(Settings state, action) {
  if (action is UpdateBusMarkerIconSize) {
    state.busMarkerIconSize = action.busMarkerIconSize;
    return state;
  }

  if (action is LoadedSettingsAction) {
    return action.settings;
  }

  return state;
}
