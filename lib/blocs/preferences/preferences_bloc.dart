import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';
import 'package:track_my_travel/blocs/preferences/preferences_state.dart';

class PreferencesBloc {
  final _currentPreferences = BehaviorSubject<PreferencesState>.seeded(
    PreferencesState([]),
  );

  final selectedRoutesPrefsController = StreamController<List<String>>();

  PreferencesBloc() {
    _loadSharedPreferences();
    selectedRoutesPrefsController.stream.listen((selectedRoutes) {
      _saveSelectedRoutesPreferences(PreferencesState(selectedRoutes));
    });
  }

  Stream<PreferencesState> get currentPreferences => _currentPreferences.stream;

  Sink<List<String>> get selectedRoutesPreferences =>
      selectedRoutesPrefsController.sink;

  Future<void> _loadSharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final selectedRoutes =
        sharedPreferences.getStringList('selectedRoutes') ?? [];
    _currentPreferences.add(PreferencesState(selectedRoutes));
  }

  void _saveSelectedRoutesPreferences(PreferencesState newState) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("selectedRoutes", newState.selectedRoutes);
    _currentPreferences.add(newState);
  }

  void close() {
    _currentPreferences.close();
    selectedRoutesPrefsController.close();
  }
}
