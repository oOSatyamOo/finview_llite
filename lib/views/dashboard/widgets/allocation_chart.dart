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
  bool _isHovered = false;

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

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        // A delayed scale-in entrance effect
        final scaleValue = (value - 0.2).clamp(0.0, 1.0) / 0.8;
        return Transform.scale(
          scale: 0.9 + (0.1 * scaleValue),
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Asset Allocation',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 250),
                      child: AspectRatio(
                        aspectRatio: 1.0,
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
                              final radius = isTouched ? 75.0 : 65.0;
                              
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
                          swapAnimationDuration: const Duration(milliseconds: 800),
                          swapAnimationCurve: Curves.easeInOut,
                        ),
                      ),
                    ),
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
