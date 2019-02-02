import 'package:bus_tracker/models/app_state.dart';

class AddSelectedRouteAction {
  final String routeName;

  AddSelectedRouteAction(this.routeName);
}

class RemoveSelectedRouteAction {
  final String routeName;

  RemoveSelectedRouteAction(this.routeName);
}

class RemoveAllSelectedRoutesAction {}

class AddAllSelectedRoutesAction {}
