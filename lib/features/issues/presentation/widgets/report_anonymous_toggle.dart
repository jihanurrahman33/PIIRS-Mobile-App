import 'package:flutter/material.dart';

/// Switch toggle tile for anonymous report submission.
class ReportAnonymousToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const ReportAnonymousToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: const Text(
        'Report Anonymously',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      subtitle: const Text(
        'Hides your name and badge from public view',
        style: TextStyle(fontSize: 11),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
