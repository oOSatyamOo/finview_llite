import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/portfolio_controller.dart';
import '../../../models/holding_model.dart';

class HoldingListItem extends StatefulWidget {
  final HoldingModel holding;
  final int index;

  const HoldingListItem({
    super.key, 
    required this.holding,
    this.index = 0,
  });

  @override
  State<HoldingListItem> createState() => _HoldingListItemState();
}

class _HoldingListItemState extends State<HoldingListItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(symbol: '\$');
    final controller = Get.find<PortfolioController>();
    
    final isPositive = widget.holding.totalGain >= 0;
    final gainColor = isPositive 
        ? Theme.of(context).colorScheme.secondary 
        : Theme.of(context).colorScheme.error;

    // Staggered delay based on index
    final int delay = widget.index * 100;

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        // Calculate a staggered value manually by using the value of a longer tween, 
        // or just use a Future.delayed in a StatefulWidget.
        // For simplicity and 60fps performance, we animate immediately but scale/translate.
        // To truly stagger with TweenAnimationBuilder, it's easier to just use standard curve offsets.
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
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
            elevation: _isHovered ? 6 : Theme.of(context).cardTheme.elevation,
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {}, // Future feature
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          widget.holding.symbol.substring(0, 1),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.holding.symbol,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            widget.holding.name,
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          currencyFormatter.format(widget.holding.totalValue),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Obx(() {
                          String gainText;
                          if (controller.returnFormat.value == ReturnFormat.absolute) {
                            gainText = '${isPositive ? '+' : '-'}${currencyFormatter.format(widget.holding.totalGain.abs())}';
                          } else {
                            gainText = '${isPositive ? '+' : '-'}${widget.holding.gainPercentage.abs().toStringAsFixed(2)}%';
                          }
                          
                          return Text(
                            gainText,
                            style: TextStyle(
                              color: gainColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
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
      ),
    );
  }
}
