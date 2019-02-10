import 'package:bus_tracker/models/models.dart';

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

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }
}
