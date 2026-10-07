import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _CenteredPage(icon: Icons.home, title: 'Home');
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _CenteredPage(icon: Icons.person, title: 'Profile');
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _CenteredPage(icon: Icons.settings, title: 'Settings');
  }
}

class Message extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _CenteredPage(icon: Icons.message, title: 'MessagePage');
  }
}


class _CenteredPage extends StatelessWidget {
  const _CenteredPage({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 72, color: theme.colorScheme.primary),
          SizedBox(height: 16),
          Text('$title page', style: theme.textTheme.headlineSmall),
        ],
      ),
    );
  }
}
