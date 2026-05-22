import 'package:finview_lite/core/constants/app_strings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../models/holding_model.dart';

class AllocationChart extends StatefulWidget {
  final List<HoldingModel> holdings;

  const AllocationChart({super.key, required this.holdings});

  @override
  State<AllocationChart> createState() => _AllocationChartState();
}

class _AllocationChartState extends State<AllocationChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    if (widget.holdings.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final colors = [
      theme.colorScheme.primary,
      theme.colorScheme.secondary,
      Colors.orangeAccent.shade400,
      Colors.purpleAccent.shade400,
      Colors.teal.shade400,
      Colors.pink.shade300,
    ];

    double total = widget.holdings.fold(
      0,
      (sum, item) => sum + item.totalValue,
    );

    return Card(
      elevation: 0,
      color: theme.cardColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: theme.dividerColor.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.chartTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (event, response) {
                      setState(() {
                        if (response?.touchedSection != null) {
                          touchedIndex =
                              response!.touchedSection!.touchedSectionIndex;
                        } else {
                          touchedIndex = -1;
                        }
                      });
                    },
                  ),
                  sectionsSpace: 4,
                  centerSpaceRadius: 50,
                  sections: List.generate(widget.holdings.length, (i) {
                    final isTouched = i == touchedIndex;
                    return PieChartSectionData(
                      color: colors[i % colors.length],
                      value: widget.holdings[i].totalValue,
                      radius: isTouched ? 60 : 50,
                      // color: colors[i % colors.length],
                      // value: value,
                      // title: isTouched
                      // ? '${holding.symbol}\n${percentage.toStringAsFixed(1)}%'
                      // : holding.symbol,
                      // radius: radius,
                      titleStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      // cornerRadius: 8,
                      title: widget.holdings[i].units
                          .toString(), // Keep chart clean, show details in legend
                      badgeWidget: isTouched
                          ? _Badge(widget.holdings[i].symbol)
                          : null,
                      badgePositionPercentageOffset: 1.2,
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Custom Legend for premium look
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 8,
              children: List.generate(widget.holdings.length, (i) {
                return _LegendItem(
                  color: colors[i % colors.length],
                  text: widget.holdings[i].symbol,

                  percentage: (widget.holdings[i].totalValue / total) * 100,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// Sub-widgets for better organization
class _Badge extends StatelessWidget {
  final String text;
  const _Badge(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  final double percentage;
  const _LegendItem({
    required this.color,
    required this.text,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          "$text ${percentage.toStringAsFixed(0)}%",
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
