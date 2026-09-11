import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/locale_bloc.dart';
import 'core/bloc/locale_state.dart';
import 'core/dependency_injection/service_locator.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_event.dart';
import 'features/issues/presentation/bloc/issue_bloc.dart';
import 'features/issues/presentation/bloc/issue_event.dart';
import 'l10n/generated/app_localizations.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => sl<AuthBloc>()..add(const CheckAuthStatusEvent()),
        ),
        BlocProvider<IssueBloc>(
          create: (_) => sl<IssueBloc>()..add(const FetchIssuesEvent()),
        ),
        BlocProvider<LocaleBloc>(create: (_) => sl<LocaleBloc>()),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, localeState) {
          return MaterialApp.router(
            title: 'PIIRS',
            debugShowCheckedModeBanner: false,
            locale: localeState.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}

/// Backwards-compatibility alias for legacy references.
typedef ZapShiftApp = PiirsApp;
