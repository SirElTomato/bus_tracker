import 'package:bus_tracker/extensions.dart';
import 'package:bus_tracker/models/app_state.dart';
import 'package:bus_tracker/models/route_data.dart';
import 'package:bus_tracker/view_models/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_cs_cache/flutter_cs_cache.dart';
import 'package:redux/redux.dart';

class SelectRoutesPage extends StatefulWidget {
  final String title;
  final Store<AppState> store;

  SelectRoutesPage({Key key, this.title, this.store}) : super(key: key);

  @override
  State createState() => SelectRoutesPageState();
}

class SelectRoutesPageState extends State<SelectRoutesPage> {
  RouteData _routeData;

  @override
  void initState() {
    super.initState();
    fetchRouteData();
  }

  @override
  Widget build(BuildContext context) {
    fetchRouteData();

    return new StoreConnector<AppState, HomePageViewModel>(
        converter: (Store<AppState> store) => HomePageViewModel.create(store),
        builder: (BuildContext context, HomePageViewModel viewModel) =>
            Scaffold(
                appBar: new AppBar(
                  title: const Text('Select Routes'),
                ),
                body: StoreConnector<AppState, HomePageViewModel>(
                    converter: (Store<AppState> store) =>
                        HomePageViewModel.create(store),
                    builder:
                        (BuildContext context, HomePageViewModel viewModel) =>
                            FutureBuilder<RouteData>(
                              future: fetchRouteData(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return _buildRouteSelector(
                                      viewModel, snapshot.data);
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                }

                                return CircularProgressIndicator();
                              },
                            ))));
  }

  SingleChildScrollView _buildRouteSelector(
      HomePageViewModel viewModel, RouteData routeData) {
    GridTile selectAllTile =
        _createRouteTile(viewModel, "All", "#b70005", 220, 88);

    List<GridTile> routeRows = _routeData.routes
        .map((route) =>
            _createRouteTile(viewModel, route.number, route.colour, 98, 98))
        .toList();
    routeRows.insert(0, selectAllTile);

    return new SingleChildScrollView(
        child: new Wrap(
      children: routeRows.toList(),
    ));
  }

  Future<RouteData> fetchRouteData() async {

    if (_routeData == null) {
      final response = await http.get(
          'http://sojbuslivetimespublic.azurewebsites.net/api/Values/v1/GetRoutes');

      if (response.statusCode == 200) {
        RouteData routeData = RouteData.fromJson(json.decode(response.body));
        _routeData = routeData;
        return routeData;
      } else {
        throw Exception('Failed to get bus data');
      }
    } else {
      return _routeData;
    }
  }

  GridTile _createRouteTile(HomePageViewModel viewModel, String routeName,
      String colorInHex, double width, double height) {
      
    final bool alreadySelected =
        viewModel.selectedRoutes.where((x) => x.name == routeName).length == 1;
    double opacity = alreadySelected ? 1.0 : 0.2;

    return new GridTile(
        child: InkResponse(
            enableFeedback: true,
            onTap: () {
              setState(() {
                if (alreadySelected) {
                  viewModel.onRemoveSelectedRoute(viewModel.selectedRoutes
                      .singleWhere((x) => x.name == routeName));
                } else {
                  viewModel.onAddSelectedRoute(SelectedRoute(name: routeName));
                }
              });
            },
            // onLongPress: , TODO: show route on map
            child: Opacity(
              opacity: opacity,
              child: Container(
                child: Center(
                    child: Text(routeName,
                        style: TextStyle(color: Colors.white, fontSize: 24))),
                width: width,
                height: height,
                margin: new EdgeInsets.fromLTRB(20, 20, 15, 0),
                decoration: new BoxDecoration(
                    color: HexColor(colorInHex),
                    borderRadius: BorderRadius.all(const Radius.circular(50))),
              ),
            )));
  }
}
