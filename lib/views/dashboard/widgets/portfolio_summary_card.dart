import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/portfolio_controller.dart';
import '../../../models/portfolio_summary_model.dart';

class PortfolioSummaryCard extends StatelessWidget {
  final PortfolioSummaryModel summary;

  const PortfolioSummaryCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(symbol: '\$');
    final controller = Get.find<PortfolioController>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Portfolio Value',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              currencyFormatter.format(summary.portfolioValue),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Total Gain/Loss: ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Obx(() {
                  final isPositive = summary.totalGain >= 0;
                  final color = isPositive 
                      ? Theme.of(context).colorScheme.secondary 
                      : Theme.of(context).colorScheme.error;
                  final icon = isPositive ? Icons.arrow_upward : Icons.arrow_downward;
                  
                  String gainText;
                  if (controller.returnFormat.value == ReturnFormat.absolute) {
                    gainText = currencyFormatter.format(summary.totalGain.abs());
                  } else {
                    final percent = summary.totalGain / (summary.portfolioValue - summary.totalGain) * 100;
                    gainText = '${percent.abs().toStringAsFixed(2)}%';
                  }

                  return GestureDetector(
                    onTap: controller.toggleReturnFormat,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: color.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          Icon(icon, size: 16, color: color),
                          const SizedBox(width: 4),
                          Text(
                            gainText,
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
