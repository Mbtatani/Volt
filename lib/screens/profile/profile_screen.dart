import 'package:flutter/material.dart';
import 'package:volt/screens/settings/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const SizedBox(height: 20),
          const Center(
            child: CircleAvatar(
              radius: 50,
              // Replace with a user's profile image
              child: Icon(Icons.person, size: 50),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Chukwudi Eze',
              style: theme.textTheme.titleLarge,
            ),
          ),
          Center(
            child: Text(
              'chukwudi.eze@email.com',
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 30),
          _buildGlassCard([
            _buildProfileTile('My Garage', Icons.directions_car_outlined, theme, context),
            _buildProfileTile('Charging History', Icons.history_outlined, theme, context),
            _buildProfileTile('Payment Methods', Icons.credit_card_outlined, theme, context),
            _buildProfileTile(
              'Settings',
              Icons.settings_outlined,
              theme,
              context,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
          ], theme),
        ],
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

  Widget _buildProfileTile(String title, IconData icon, ThemeData theme, BuildContext context, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: theme.listTileTheme.iconColor),
      title: Text(title, style: theme.textTheme.bodyLarge),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: theme.listTileTheme.iconColor),
      onTap: onTap,
    );
  }
}
