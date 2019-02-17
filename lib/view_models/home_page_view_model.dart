import 'package:bus_tracker/models/app_state.dart';
import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/redux/actions.dart';
import 'package:redux/redux.dart';

class HomePageViewModel {
  final List<SelectedRoute> selectedRoutes;
  final Function(SelectedRoute) onAddSelectedRoute;
  final Function(SelectedRoute) onRemoveSelectedRoute;
  final Function() onRemoveAllSelectedRoutes;
  final Settings settings;
  final Function(int) onUpdateBusMarkerIconSize;

  HomePageViewModel({
    this.selectedRoutes,
    this.onAddSelectedRoute,
    this.onRemoveSelectedRoute,
    this.onRemoveAllSelectedRoutes,
    this.settings,
    this.onUpdateBusMarkerIconSize,
  });

  factory HomePageViewModel.create(Store<AppState> store) {
    _onAddSelectedRoute(SelectedRoute routeName) {
      store.dispatch(AddSelectedRouteAction(routeName));
    }

    _onRemoveSelectedRoute(SelectedRoute routeName) {
      store.dispatch(RemoveSelectedRouteAction(routeName));
    }

    _onRemoveAllSelectedRoutes() {
      store.dispatch(RemoveAllSelectedRoutesAction());
    }

    _onUpdateBusMarkerIconSize(int busMarkerIconSize) {
      store.dispatch(UpdateBusMarkerIconSize(busMarkerIconSize));
    }

    return HomePageViewModel(
      selectedRoutes: store.state.selectedRoutes,
      onAddSelectedRoute: _onAddSelectedRoute,
      onRemoveSelectedRoute: _onRemoveSelectedRoute,
      onRemoveAllSelectedRoutes: _onRemoveAllSelectedRoutes,
      settings: store.state.settings,
      onUpdateBusMarkerIconSize: _onUpdateBusMarkerIconSize,
    );
  }
}
