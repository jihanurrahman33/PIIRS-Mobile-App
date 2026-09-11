import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Interactive list tile for citizen premium status and upgrade actions.
class ProfilePremiumTile extends StatelessWidget {
  final bool isPremium;

  const ProfilePremiumTile({super.key, this.isPremium = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isPremium ? Icons.verified_rounded : Icons.star_rounded,
        color: Colors.amber,
      ),
      title: Text(
        isPremium ? 'Premium Active' : 'Upgrade to Premium',
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        isPremium
            ? 'Priority inspection enabled'
            : 'Priority inspection & direct staff chat',
        style: const TextStyle(fontSize: 11),
      ),
      trailing: isPremium
          ? const Icon(Icons.check_circle_rounded, color: Colors.amber)
          : const Icon(Icons.chevron_right_rounded),
      onTap: () => context.push('/premium'),
    );
  }
}
