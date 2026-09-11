import 'package:flutter/material.dart';

import '../widgets/profile_header_card.dart';
import '../widgets/profile_settings_list_card.dart';

/// Citizen Profile Tab Page conforming to Stitch profile layout under 80 lines.
class CitizenProfilePage extends StatelessWidget {
  const CitizenProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            ProfileHeaderCard(),
            SizedBox(height: 14),
            ProfileSettingsListCard(),
          ],
        ),
      ),
    );
  }
}
