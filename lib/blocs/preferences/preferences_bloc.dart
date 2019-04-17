import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';
import 'package:track_my_travel/blocs/preferences/preferences_state.dart';

class PreferencesEvent {}

class GetPreferences {}

class SavePreferences {
  final 
}

class PreferencesBloc
    extends Bloc<PreferencesEvent, BehaviorSubject<PreferencesState>> {
  final _currentPreferences = BehaviorSubject<PreferencesState>();

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

  @override
  // TODO: implement initialState
  BehaviorSubject<PreferencesState> get initialState => currentPreferences;

  @override
  Stream<BehaviorSubject<PreferencesState>> mapEventToState(PreferencesEvent event) async* {
    switch (event) {
      case PreferencesEvent.getPreferences:
        _loadSharedPreferences();
        break;
      case PreferencesEvent.savePreferences:
        _saveSelectedRoutesPreferences(event)
      
    }
  }
}
