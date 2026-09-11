import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/dependency_injection/service_locator.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize global service locator dependencies
  await setupServiceLocator();

  runApp(const PiirsApp());
}

/// Root widget of PIIRS Mobile Application.
class PiirsApp extends StatelessWidget {
  const PiirsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => sl<AuthBloc>()..add(const CheckAuthStatusEvent()),
      child: MaterialApp.router(
        title: 'PIIRS',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRouter.router,
      ),
    );
  }
}

/// Backwards-compatibility alias for legacy references.
typedef ZapShiftApp = PiirsApp;
