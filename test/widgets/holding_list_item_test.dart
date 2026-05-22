import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:finview_lite/controllers/portfolio_controller.dart';
import 'package:finview_lite/models/holding_model.dart';
import 'package:finview_lite/views/dashboard/widgets/holding_list_item.dart';

void main() {
  setUp(() {
    Get.put(PortfolioController());
  });

  tearDown(() {
    Get.delete<PortfolioController>(force: true);
  });

  testWidgets('HoldingListItem displays data correctly',
      (WidgetTester tester) async {
    const holding = HoldingModel(
      symbol: 'AAPL',
      name: 'Apple Inc.',
      units: 10,
      avgCost: 100.0,
      currentPrice: 150.0,
    );

    await tester.pumpWidget(
      const GetMaterialApp(
        home: Scaffold(
          body: HoldingListItem(holding: holding, index: 0),
        ),
      ),
    );

    // Settle all entrance animations (TweenAnimationBuilder)
    await tester.pumpAndSettle();

    expect(find.text('AAPL'), findsOneWidget);
    expect(find.text('Apple Inc.'), findsOneWidget);
    // Total value = 10 * 150.0 = $1,500.00
    expect(find.text('\$1,500.00'), findsOneWidget);
    // Gain % = (150-100)/100 * 100 = 50%
    expect(find.text('+50.00%'), findsOneWidget);
  });
}
