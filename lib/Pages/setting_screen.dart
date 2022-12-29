import 'package:flutter/material.dart';
import 'package:massenger/massenger_home.dart';
import 'package:settings_ui/settings_ui.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text('Setting'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: true,
              leading: Icon(Icons.format_paint),
              title: Text('Enable custom theme'),
            ),
          ],
        ),
      ],
    );
  }
}
