import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters_screen';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _vegan = false;
  var _glutenFree = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  Widget buildSwitchListTile(String title, String description,
      bool booleanFilter, Function(bool) _updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: booleanFilter,
        onChanged: _updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: MainDrawer(),
        appBar: AppBar(title: Text('Your Filters')),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(children: [
                buildSwitchListTile('Vegan', 'Filter for vegan foods', _vegan,
                    (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
                buildSwitchListTile(
                    'Gluten Free', 'Filter for gluten-free meals', _glutenFree,
                    (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian', 'Filter for vegetarian meals', _vegetarian,
                    (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
                buildSwitchListTile('Lactose-Free',
                    'Filter for lactose-free meals', _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                })
              ]),
            )
          ],
        ));
  }
}
