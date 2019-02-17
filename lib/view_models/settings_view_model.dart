import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/redux/actions.dart';
import 'package:redux/redux.dart';

class SettingsPageViewModel {
  final Settings settings;
  final Function(int) onUpdateBusMarkerIconSize;

  SettingsPageViewModel({
    this.settings,
    this.onUpdateBusMarkerIconSize,
  });

  factory SettingsPageViewModel.create(Store<AppState> store) {
    _onUpdateBusMarkerIconSize(int busMarkerIconSize) {
      store.dispatch(UpdateBusMarkerIconSize(busMarkerIconSize));
    }

    return SettingsPageViewModel(
      settings: store.state.settings,
      onUpdateBusMarkerIconSize: _onUpdateBusMarkerIconSize,
    );
  }
}
