import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:bus_tracker/components/tab_selector.dart';
import 'package:bus_tracker/models/models.dart';
import 'package:bus_tracker/presentation/select_routes_page.dart';
import 'package:bus_tracker/view_models/home_page_view_model.dart';
import 'package:bus_tracker/view_models/settings_view_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redux/redux.dart';

class ChangeIconSizePage extends StatefulWidget {
  final String title;
  final Store<AppState> store;

  ChangeIconSizePage({Key key, this.title, this.store}) : super(key: key);

  @override
  State createState() => ChangeIconSizePageState();
}

class ChangeIconSizePageState extends State<ChangeIconSizePage> {
  double _sliderValue = 1.0;
  int iconSize = IconSize.small;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Bus Marker Size"),
      ),
      body: StoreConnector<AppState, SettingsPageViewModel>(
          converter: (Store<AppState> store) =>
              SettingsPageViewModel.create(store),
          builder: (BuildContext context, SettingsPageViewModel viewModel) =>
              addYourRating(viewModel)),
    );
  }

  Widget addYourRating(SettingsPageViewModel viewModel) {
    switch (viewModel.settings.busMarkerIconSize) {
      case 100:
        _sliderValue = 1;
        break;
      case 150:
        _sliderValue = 2;
        break;
      case 200:
        _sliderValue = 3;
        break;
      case 250:
        _sliderValue = 4;
        break;
      default:
        _sliderValue = 1;
    }
    iconSize = viewModel.settings.busMarkerIconSize;
    return Column(
      children: <Widget>[
        Container(
          width: 370,
          child: Image.asset(
              "assets/bus_markers/" + iconSize.toString() + "/15.png"),
          padding: EdgeInsets.fromLTRB(100, 50, 100, 50),
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // In a row, column, listview, etc., a Flexible widget is a wrapper
              // that works much like CSS's flex-grow property.
              //
              // Any room left over in the main axis after
              // the widgets are given their width
              // will be distributed to all the flexible widgets
              // at a ratio based on the flex property you pass in.
              // Because this is the only Flexible widget,
              // it will take up all the extra space.
              //
              // In other words, it will expand as much as it can until
              // the all the space is taken up.
              Flexible(
                flex: 1,
                // A slider, like many form elements, needs to know its
                // own value and how to update that value.
                //
                // The slider will call onChanged whenever the value
                // changes. But it will only repaint when its value property
                // changes in the state using setState.
                //
                // The workflow is:
                // 1. User drags the slider.
                // 2. onChanged is called.
                // 3. The callback in onChanged sets the sliderValue state.
                // 4. Flutter repaints everything that relies on sliderValue,
                // in this case, just the slider at its new value.
                child: Slider(
                  activeColor: Colors.indigoAccent,
                  min: 0.0,
                  max: 4.0,
                  onChanged: (newRating) {
                    handleChangeBusMarkerSize(newRating, viewModel);
                  },
                  value: _sliderValue,
                ),
              ),

              // This is the part that displays the value of the slider.
              Container(
                width: 50.0,
                alignment: Alignment.center,
                child: Text('${_sliderValue.toInt()}',
                    style: Theme.of(context).textTheme.display1),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void handleChangeBusMarkerSize(newRating, SettingsPageViewModel viewModel) {
    setState(() {
      if (newRating < 2) {
        iconSize = IconSize.small;
        viewModel.onUpdateBusMarkerIconSize(IconSize.small);
      } else if (newRating < 3) {
        iconSize = IconSize.medium;
        viewModel.onUpdateBusMarkerIconSize(IconSize.medium);
      } else if (newRating < 4) {
        iconSize = IconSize.large;
        viewModel.onUpdateBusMarkerIconSize(IconSize.large);
      } else if (newRating < 5) {
        iconSize = IconSize.x_large;
        viewModel.onUpdateBusMarkerIconSize(IconSize.x_large);
      }

      _sliderValue = newRating;
    });
  }
}
