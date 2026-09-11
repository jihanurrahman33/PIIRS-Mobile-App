import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/location_bottom_sheet_panel_widget.dart';
import '../widgets/location_map_viewport_widget.dart';
import '../widgets/location_picker_search_bar_widget.dart';

/// Full interactive map location picker for pinpointing infrastructure hazards.
class LocationPickerPage extends StatelessWidget {
  const LocationPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Select Issue Location'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const LocationMapViewportWidget(),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LocationPickerSearchBarWidget(onBack: () => context.pop()),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: LocationBottomSheetPanelWidget(
                onConfirm: () => context.pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
