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

    final colors = [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.secondary,
      Colors.orangeAccent,
      Colors.purpleAccent,
      Colors.cyan,
      Colors.pinkAccent,
    ];

    double total = widget.holdings.fold(0, (sum, item) => sum + item.totalValue);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Asset Allocation',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 1.5,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: List.generate(widget.holdings.length, (i) {
                    final holding = widget.holdings[i];
                    final value = holding.totalValue;
                    final percentage = (value / total) * 100;
                    final isTouched = i == touchedIndex;
                    final radius = isTouched ? 70.0 : 60.0;
                    
                    return PieChartSectionData(
                      color: colors[i % colors.length],
                      value: value,
                      title: isTouched 
                          ? '${holding.symbol}\n${percentage.toStringAsFixed(1)}%'
                          : holding.symbol,
                      radius: radius,
                      titleStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
