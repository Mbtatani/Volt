import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volt/providers/settings_provider.dart';
import 'package:volt/providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: const BackButton(),
      ),
      body: Consumer2<ThemeProvider, SettingsProvider>(
        builder: (context, themeProvider, settingsProvider, child) {
          return ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              _buildSectionHeader('ACCOUNT', theme),
              _buildGlassCard([
                _buildSettingsTile('Edit Profile', Icons.person_outline, theme, context),
                _buildSettingsTile('Change Password', Icons.lock_outline, theme, context),
                _buildSettingsTile('Manage Payment Methods', Icons.credit_card_outlined, theme, context),
              ], theme),
              _buildSectionHeader('NOTIFICATIONS', theme),
              _buildGlassCard([
                _buildSwitchTile(
                  'Low Battery Alerts',
                  settingsProvider.lowBatteryAlerts,
                  settingsProvider.setLowBatteryAlerts,
                  theme,
                ),
                _buildSwitchTile(
                  'Charging Complete Alerts',
                  settingsProvider.chargingCompleteAlerts,
                  settingsProvider.setChargingCompleteAlerts,
                  theme,
                ),
                _buildSwitchTile(
                  'Promotional Updates',
                  settingsProvider.promotionalUpdates,
                  settingsProvider.setPromotionalUpdates,
                  theme,
                ),
              ], theme),
              _buildSectionHeader('APPEARANCE', theme),
              _buildGlassCard([
                _buildThemeSelector(theme, themeProvider, context),
              ], theme),
              _buildSectionHeader('APP INFORMATION', theme),
              _buildGlassCard([
                _buildSettingsTile('Help & Support', Icons.help_outline, theme, context),
                _buildSettingsTile('Terms of Service', Icons.description_outlined, theme, context),
                _buildSettingsTile('Privacy Policy', Icons.privacy_tip_outlined, theme, context),
              ], theme),
              const SizedBox(height: 20),
              _buildLogoutButton(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGlassCard(List<Widget> children, ThemeData theme) {
    return Card(
      elevation: 0,
      color: theme.cardColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSectionHeader(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildSettingsTile(String title, IconData icon, ThemeData theme, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: theme.listTileTheme.iconColor),
      title: Text(title, style: theme.textTheme.bodyLarge),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: theme.listTileTheme.iconColor),
      onTap: () {},
    );
  }

  Widget _buildSwitchTile(String title, bool value, ValueChanged<bool> onChanged, ThemeData theme) {
    return SwitchListTile(
      title: Text(title, style: theme.textTheme.bodyLarge),
      value: value,
      onChanged: onChanged,
      activeTrackColor: theme.primaryColor.withOpacity(0.5),
      activeColor: theme.primaryColor,
    );
  }

  Widget _buildThemeSelector(ThemeData theme, ThemeProvider themeProvider, BuildContext context) {
    return ListTile(
      leading: Icon(Icons.brightness_6_outlined, color: theme.listTileTheme.iconColor),
      title: Text('Theme', style: theme.textTheme.bodyLarge),
      trailing: DropdownButton<ThemeMode>(
        value: themeProvider.themeMode,
        onChanged: (ThemeMode? newValue) {
          if (newValue != null) {
            themeProvider.setThemeMode(newValue);
          }
        },
        items: const [
          DropdownMenuItem(
            value: ThemeMode.light,
            child: Text('Light'),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text('Dark'),
          ),
          DropdownMenuItem(
            value: ThemeMode.system,
            child: Text('System'),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            'Log Out',
            style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
