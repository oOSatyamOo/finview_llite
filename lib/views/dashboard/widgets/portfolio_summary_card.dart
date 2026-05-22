import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/portfolio_controller.dart';
import '../../../core/constants/app_strings.dart';
import '../../../models/portfolio_summary_model.dart';

class PortfolioSummaryCard extends StatefulWidget {
  final PortfolioSummaryModel summary;

  const PortfolioSummaryCard({super.key, required this.summary});

  @override
  State<PortfolioSummaryCard> createState() => _PortfolioSummaryCardState();
}

class _PortfolioSummaryCardState extends State<PortfolioSummaryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(symbol: '\$');
    final controller = Get.find<PortfolioController>();

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
          child: Card(
            elevation: _isHovered ? 8 : Theme.of(context).cardTheme.elevation,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.summaryTotalValue,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currencyFormatter.format(widget.summary.portfolioValue),
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        AppStrings.summaryTotalGainLoss,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      Obx(() {
                        final isPositive = widget.summary.totalGain >= 0;
                        final color = isPositive 
                            ? Theme.of(context).colorScheme.secondary 
                            : Theme.of(context).colorScheme.error;
                        final icon = isPositive ? Icons.arrow_upward : Icons.arrow_downward;
                        
                        String gainText;
                        if (controller.returnFormat.value == ReturnFormat.absolute) {
                          gainText = currencyFormatter.format(widget.summary.totalGain.abs());
                        } else {
                          final percent = widget.summary.totalGain / (widget.summary.portfolioValue - widget.summary.totalGain) * 100;
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
          ),
        ),
      ),
    );
  }
}
