import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

class PrefsState {
  final bool showLocation;

  const PrefsState(this.showLocation);
}

class PrefsBloc {
  final _currentPrefs =
      BehaviorSubject<PrefsState>(seedValue: PrefsState(true));

  final _showLocationPref = StreamController<bool>();

  PrefsBloc() {
    _loadSharedPrefs();
    _showLocationPref.stream.listen((bool) {
      _saveNewPrefs(PrefsState(bool));
    });
  }

  Stream<PrefsState> get currentPrefs => _currentPrefs.stream;

  Sink<bool> get showLocationPref => _showLocationPref.sink;

  void close() {
    _showLocationPref.close();
    _currentPrefs.close();
  }

  Future<void> _loadSharedPrefs() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final showLocation = sharedPrefs.getBool('showLocation') ?? true;
    _currentPrefs.add(PrefsState(showLocation));
  }

  Future<void> _saveNewPrefs(PrefsState newState) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool('showLocation', newState.showLocation);
    _currentPrefs.add(newState);
  }
}
