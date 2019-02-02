import 'package:bus_tracker/models/app_state.dart';

class AddSelectedRouteAction {
  final SelectedRoute route;

  AddSelectedRouteAction(this.route);
}

class RemoveSelectedRouteAction {
  final SelectedRoute route;

  RemoveSelectedRouteAction(this.route);
}

// class AddAllSelectedRoutesAction {
//   final List<String> routes;

//   AddSelectedRouteAction(this.route);
// }

class RemoveAllSelectedRoutesAction {}
