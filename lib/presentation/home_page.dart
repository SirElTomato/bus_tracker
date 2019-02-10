import 'package:bus_tracker/components/active_tab.dart';
import 'package:bus_tracker/components/tab_selector.dart';
import 'package:bus_tracker/containers/map_container.dart';
import 'package:bus_tracker/containers/settings_container.dart';
import 'package:bus_tracker/containers/timetable_container.dart';
import 'package:bus_tracker/models/models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final void Function() onInit;

  HomePage({@required this.onInit});

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        Widget body;
        if (activeTab == AppTab.map) {
          body = MapContainer();
        } else if (activeTab == AppTab.settings) {
          body = SettingsContainer();
        } else {
          body = TimetableContainer();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Island Mapper'),
          ),
          body: body,
          bottomNavigationBar: TabSelector(),
        );
      },
    );
  }
}

// class HomePage extends StatefulWidget {
//   final String title;
//   final Store<AppState> store;

//   HomePage({Key key, this.title, this.store}) : super(key: key);

//   @override
//   State createState() => HomePageState();
// }

// class HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//   List<BottomNavigationBarItem> _list = [
//     new BottomNavigationBarItem(
//       icon: Icon(Icons.map),
//       title: Text('Map'),
//     ),
//     new BottomNavigationBarItem(
//       icon: Icon(Icons.featured_play_list),
//       title: Text('Timetable'),
//     ),
//     new BottomNavigationBarItem(
//         icon: Icon(Icons.person), title: Text('Settings'))
//   ];

//   final List<Widget> _pages = [
//   //  Page1(title: 'Page1', store: store)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, HomePageViewModel>(
//       converter: (Store<AppState> store) => HomePageViewModel.create(store),
//       builder: (BuildContext context, HomePageViewModel viewModel) =>
//           _pages[viewModel.currentIndex],
//     );
//   }

//   // Widget getPage(store)

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }
