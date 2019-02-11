import 'package:flutter/foundation.dart';

class SelectedRoute {
  final String name;

  SelectedRoute({@required this.name});

  SelectedRoute copyWith({String name}) {
    return SelectedRoute(name: name ?? this.name);
  }

  SelectedRoute.fromJson(Map json) : name = json['name'];

  Map toJson() => {
        'name': name,
      };
}