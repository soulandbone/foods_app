import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: MainDrawer(),
        appBar: AppBar(title: Text('Your Filters')),
        body: Center(
          child: Text('Hello'),
        ));
  }
}
