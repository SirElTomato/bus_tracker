import 'dart:async';
import 'dart:convert';

import 'package:bus_tracker/models/app_state.dart';
import 'package:bus_tracker/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveToPreferences(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = json.encode(state);
  // var selectedRoutes = '{"selectedRoutes":' + json.encode(state.selectedRoutes) + '}';

  // await preferences.setString('selectedRoutesState', selectedRoutes);
  await preferences.setString('appState', string);
}

Future<AppState> loadFromPreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = preferences.getString('appState');
  if (string != null) {
    Map map = json.decode(string);
    return AppState.fromJson(map);
  }

  return AppState.initialState();
}

void appStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  if (action is AddSelectedRouteAction ||
      action is RemoveSelectedRouteAction ||
      action is RemoveAllSelectedRoutesAction) {
    saveToPreferences(store.state);
  }

  if (action is GetSelectedRoutesAction) {
    await loadFromPreferences().then((state) =>
        store.dispatch(LoadedSelectedRoutesAction(state.selectedRoutes)));
  }

  if (action is UpdateBusMarkerIconSize) {
    saveToPreferences(store.state);
  }

  if (action is GetSettingsAction) {
    await loadFromPreferences()
        .then((state) => store.dispatch(LoadedSettingsAction(state.settings)));
  }
}
