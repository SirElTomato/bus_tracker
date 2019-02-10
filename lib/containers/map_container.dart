import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/redux/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MapContainer extends StatelessWidget {
  MapContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Center(child: Text('MapContainer'));
      },
    );
  }
}

class _ViewModel {
  final List<SelectedRoute> selectedRoutes;
  final Function(SelectedRoute) onAddSelectedRoute;
  final Function(SelectedRoute) onRemoveSelectedRoute;
  final Function() onRemoveAllSelectedRoutes;

  _ViewModel({
    this.selectedRoutes,
    this.onAddSelectedRoute,
    this.onRemoveSelectedRoute,
    this.onRemoveAllSelectedRoutes,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        selectedRoutes: store.state.selectedRoutes,
        onAddSelectedRoute: (routeName) {
          store.dispatch(AddSelectedRouteAction(routeName));
        },
        onRemoveSelectedRoute: (routeName) {
          store.dispatch(RemoveSelectedRouteAction(routeName));
        },
        onRemoveAllSelectedRoutes: () {
          store.dispatch(RemoveAllSelectedRoutesAction());
        });
  }

  factory _ViewModel.create(Store<AppState> store) {
    _onAddSelectedRoute(SelectedRoute routeName) {
      store.dispatch(AddSelectedRouteAction(routeName));
    }

    _onRemoveSelectedRoute(SelectedRoute routeName) {
      store.dispatch(RemoveSelectedRouteAction(routeName));
    }

    _onRemoveAllSelectedRoutes() {
      store.dispatch(RemoveAllSelectedRoutesAction());
    }

    return _ViewModel(
      selectedRoutes: store.state.selectedRoutes,
      onAddSelectedRoute: _onAddSelectedRoute,
      onRemoveSelectedRoute: _onRemoveSelectedRoute,
      onRemoveAllSelectedRoutes: _onRemoveAllSelectedRoutes,
    );
  }
}
