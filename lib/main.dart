import 'package:flutter/material.dart';

import 'core/dependency_injection/service_locator.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize global service locator dependencies
  await setupServiceLocator();

  runApp(const ZapShiftApp());
}

/// Root widget of ZapShift / PIIRS Mobile Application.
class ZapShiftApp extends StatelessWidget {
  const ZapShiftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ZapShift',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
