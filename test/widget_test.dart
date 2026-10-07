import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:drawer_navigation_widget/main.dart';

void main() {
  testWidgets('Drawer item switches the page and closes the drawer', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(DrawerDemoApp());

    expect(find.widgetWithText(AppBar, 'Home'), findsOneWidget);
    expect(find.byType(Drawer), findsNothing);

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    expect(find.byType(Drawer), findsOneWidget);

    await tester.tap(find.widgetWithText(ListTile, 'Profile'));
    await tester.pumpAndSettle();

    expect(find.byType(Drawer), findsNothing);
    expect(find.widgetWithText(AppBar, 'Profile'), findsOneWidget);
    expect(find.text('Profile page'), findsOneWidget);
  });
}
