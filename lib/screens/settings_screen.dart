import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.onSettingsChanged, this.settings, {super.key});

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      inactiveTrackColor: const Color.fromARGB(255, 214, 213, 213),
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glúten',
                  'Só exibir refeições sem glúten',
                  settings!.isGlutenFree,
                  (value) => setState(() => settings!.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibir refeições sem lactose',
                  settings!.isLactoseFree,
                  (value) => setState(() => settings!.isLactoseFree = value),
                ),
                _createSwitch(
                  'Refeições Veganas',
                  'Só exibir refeições refeições veganas',
                  settings!.isVegan,
                  (value) => setState(() => settings!.isVegan = value),
                ),
                _createSwitch(
                  'Refeições Vegetarianas',
                  'Só exibir refeições vegetarianas',
                  settings!.isVegetarian,
                  (value) => setState(() => settings!.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
