import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:finview_lite/controllers/portfolio_controller.dart';
import 'package:finview_lite/models/portfolio_summary_model.dart';
import 'package:finview_lite/views/dashboard/widgets/portfolio_summary_card.dart';

void main() {
  setUp(() {
    final controller = PortfolioController();
    Get.put(controller);
  });

  tearDown(() {
    Get.delete<PortfolioController>();
  });

  testWidgets('PortfolioSummaryCard displays total value and gain', (WidgetTester tester) async {
    const summary = PortfolioSummaryModel(
      user: 'Test User',
      portfolioValue: 15000.0,
      totalGain: 2500.0,
      holdings: [],
    );

    await tester.pumpWidget(
      const GetMaterialApp(
        home: Scaffold(
          body: PortfolioSummaryCard(summary: summary),
        ),
      ),
    );

    expect(find.text('Total Portfolio Value'), findsOneWidget);
    expect(find.text('\$15,000.00'), findsOneWidget);
    expect(find.text('20.00%'), findsOneWidget); // Gain percentage = 2500 / (15000 - 2500) = 2500/12500 = 20%
    
    // Test tapping to toggle absolute return format
    await tester.tap(find.text('20.00%'));
    await tester.pumpAndSettle();
    
    expect(find.text('\$2,500.00'), findsOneWidget);
  });
}
