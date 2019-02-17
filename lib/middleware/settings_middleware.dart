import 'dart:async';
import 'dart:convert';
import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveToPreferences(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = json.encode(state.settings.toJson());

  await preferences.setString('settings', string);
}

Future<AppState> loadFromPreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = preferences.getString('settings');
  if (string != null) {
    Map map = json.decode(string);
    return AppState.fromJson(map);
  }

  return AppState.initialState();
}

void appStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  next(action);


  if (action is UpdateBusMarkerIconSize) {
    saveToPreferences(store.state);
  }

  if (action is GetSettingsAction) {
    await loadFromPreferences().then((state) =>
        store.dispatch(LoadedSettingsAction(state.settings)));
  }
}
