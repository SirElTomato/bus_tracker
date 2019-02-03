import 'package:bus_tracker/models/app_state.dart';

class AddSelectedRouteAction {
  // final String routeName;
  final SelectedRoute selectedRoute;

  AddSelectedRouteAction(this.selectedRoute);
}

class RemoveSelectedRouteAction {
  // final String routeName;
  final SelectedRoute selectedRoute;

  RemoveSelectedRouteAction(this.selectedRoute);
}

class RemoveAllSelectedRoutesAction {}

class AddAllSelectedRoutesAction {}

class GetSelectedRoutesAction {}

class LoadedSelectedRoutesAction {
  final List<SelectedRoute> selectedRoutes;

  LoadedSelectedRoutesAction(this.selectedRoutes);
}
