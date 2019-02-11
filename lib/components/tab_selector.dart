// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/redux/actions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'dart:collection';

class TabSelector extends StatelessWidget {
  TabSelector({Key key}) : super(key: key);
  final HashMap<AppTab, Icon> tabIcons = new HashMap<AppTab, Icon>();
  final HashMap<AppTab, Text> tabText = new HashMap<AppTab, Text>();

  @override
  Widget build(BuildContext context) {
    tabIcons[AppTab.map] = Icon(Icons.map);
    tabIcons[AppTab.timetable] = Icon(Icons.featured_play_list);
    tabIcons[AppTab.settings] = Icon(Icons.settings);
    tabText[AppTab.map] = Text('Map');
    tabText[AppTab.timetable] = Text('Timetable');
    tabText[AppTab.settings] = Text('Settings');

    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return BottomNavigationBar(
          currentIndex: AppTab.values.indexOf(vm.activeTab),
          onTap: vm.onTabSelected,
          items: AppTab.values.map((tab) {
            return BottomNavigationBarItem(
              icon: tabIcons[tab],
              title: tabText[tab],
            );
          }).toList(),
        );
      },
    );
  }
}

class _ViewModel {
  final AppTab activeTab;
  final Function(int) onTabSelected;

  _ViewModel({
    @required this.activeTab,
    @required this.onTabSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      activeTab: store.state.activeTab,
      onTabSelected: (index) {
        store.dispatch(UpdateTabAction((AppTab.values[index])));
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          activeTab == other.activeTab;

  @override
  int get hashCode => activeTab.hashCode;
}
