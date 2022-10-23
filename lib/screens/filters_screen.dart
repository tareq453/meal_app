import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const route = "/filters";
  final Function saveFilterHandler;
  final Map<String, bool> filterMap;

  const FiltersScreen(
      {Key? key, required this.filterMap, required this.saveFilterHandler})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filterMap['gluten']!;
    _vegetarian = widget.filterMap['vegetarian']!;
    _vegan = widget.filterMap['vegan']!;
    _lactoseFree = widget.filterMap['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) handler) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(description),
      onChanged: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Filter"),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                Map<String, bool> filterMap = {
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegetarian": _vegetarian,
                  "vegan": _vegan
                };
                widget.saveFilterHandler(filterMap);
              },
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adjust your meal",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                      "Gluten-Free",
                      "Only include gluten to the meal",
                      _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      "Vegetarian",
                      "Only include vegetarian to the meal",
                      _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      "Vegan", "Only include vegan to the meal", _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      "Lactose-Free",
                      "Only include lactose to the meal",
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
