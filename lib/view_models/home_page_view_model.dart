import 'package:bus_tracker/models/app_state.dart';
import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/redux/actions.dart';
import 'package:redux/redux.dart';

class HomePageViewModel {
  final List<SelectedRoute> selectedRoutes;
  final Function(SelectedRoute) onAddSelectedRoute;
  final Function(SelectedRoute) onRemoveSelectedRoute;
  final Function() onRemoveAllSelectedRoutes;
  final int currentIndex;
  final Function(int) onUpdateCurrentIndex;

  HomePageViewModel({
    this.selectedRoutes,
    this.onAddSelectedRoute,
    this.onRemoveSelectedRoute,
    this.onRemoveAllSelectedRoutes,
    this.currentIndex,
    this.onUpdateCurrentIndex,
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

    // _onUpdateCurrentIndex(int newCurrentIndex) {
    //   store.dispatch(UpdateCurrentIndexAction(newCurrentIndex));
    // }

    return HomePageViewModel(
      selectedRoutes: store.state.selectedRoutes,
      onAddSelectedRoute: _onAddSelectedRoute,
      onRemoveSelectedRoute: _onRemoveSelectedRoute,
      onRemoveAllSelectedRoutes: _onRemoveAllSelectedRoutes,
      // currentIndex: store.state.currentIndex,
      // onUpdateCurrentIndex: _onUpdateCurrentIndex,
    );
  }
}
