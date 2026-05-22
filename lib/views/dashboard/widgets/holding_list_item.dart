import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/portfolio_controller.dart';
import '../../../models/holding_model.dart';

class HoldingListItem extends StatelessWidget {
  final HoldingModel holding;

  const HoldingListItem({super.key, required this.holding});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(symbol: '\$');
    final controller = Get.find<PortfolioController>();
    
    final isPositive = holding.totalGain >= 0;
    final gainColor = isPositive 
        ? Theme.of(context).colorScheme.secondary 
        : Theme.of(context).colorScheme.error;

    return Card(
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
                    holding.symbol.substring(0, 1),
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
                      holding.symbol,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      holding.name,
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
                    currencyFormatter.format(holding.totalValue),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Obx(() {
                    String gainText;
                    if (controller.returnFormat.value == ReturnFormat.absolute) {
                      gainText = '${isPositive ? '+' : '-'}${currencyFormatter.format(holding.totalGain.abs())}';
                    } else {
                      gainText = '${isPositive ? '+' : '-'}${holding.gainPercentage.abs().toStringAsFixed(2)}%';
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
    );
  }
}
