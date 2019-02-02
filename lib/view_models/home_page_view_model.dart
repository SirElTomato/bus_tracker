import 'package:bus_tracker/models/app_state.dart';
import 'package:bus_tracker/redux/actions.dart';
import 'package:redux/redux.dart';

class HomePageViewModel {
  final List<SelectedRoute> selectedRoutes;
  final Function(String) onAddSelectedRoute;
  final Function(String) onRemoveSelectedRoute;
  final Function() onRemoveAllSelectedRoutes;

  HomePageViewModel({
    this.selectedRoutes,
    this.onAddSelectedRoute,
    this.onRemoveSelectedRoute,
    this.onRemoveAllSelectedRoutes,
  });

  factory HomePageViewModel.create(Store<AppState> store) {
    _onAddSelectedRoute(String routeName) {
      store.dispatch(AddSelectedRouteAction(routeName));
    }

    _onRemoveSelectedRoute(String routeName) {
      store.dispatch(RemoveSelectedRouteAction(routeName));
    }

    _onRemoveAllSelectedRoutes() {
      store.dispatch(RemoveAllSelectedRoutesAction());
    }

    return HomePageViewModel(
      selectedRoutes: store.state.selectedRoutes,
      onAddSelectedRoute: _onAddSelectedRoute,
      onRemoveSelectedRoute: _onRemoveSelectedRoute,
      onRemoveAllSelectedRoutes: _onRemoveAllSelectedRoutes,
    );
  }
}
