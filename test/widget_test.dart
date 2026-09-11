import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zapshift/core/dependency_injection/service_locator.dart';
import 'package:zapshift/core/network/api_client.dart';
import 'package:zapshift/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  setUp(() async {
    if (!sl.isRegistered<ApiClient>()) {
      await setupServiceLocator();
    }
  });

  testWidgets('PiirsApp launches SplashPage as initial route', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PiirsApp());

    expect(find.text('PIIRS'), findsOneWidget);
  });
}
