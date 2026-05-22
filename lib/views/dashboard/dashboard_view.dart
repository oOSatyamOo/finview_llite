import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/portfolio_controller.dart';
import '../../controllers/theme_controller.dart';
import '../../core/widgets/seamless_error_widget.dart';
import 'widgets/allocation_chart.dart';
import 'widgets/holding_list_item.dart';
import 'widgets/portfolio_summary_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject PortfolioController
    final portfolioController = Get.put(PortfolioController());
    final authController = Get.find<AuthController>();
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('FinView Lite'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: portfolioController.refreshData,
          ),
          Obx(() => IconButton(
            icon: Icon(themeController.isDarkMode.value 
                ? Icons.light_mode 
                : Icons.dark_mode),
            onPressed: themeController.toggleTheme,
          )),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: authController.logout,
          ),
        ],
      ),
      body: Obx(() {
        if (portfolioController.isLoading.value && portfolioController.portfolio.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (portfolioController.error.value != null && portfolioController.portfolio.value == null) {
          return SeamlessErrorWidget(
            failure: portfolioController.error.value!,
            onRetry: portfolioController.loadPortfolio,
          );
        }

        if (portfolioController.portfolio.value == null) {
          return const Center(child: Text('No data available.'));
        }

        return Stack(
          children: [
            RefreshIndicator(
              onRefresh: portfolioController.refreshData,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Text(
                          'Welcome back, Investor',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        PortfolioSummaryCard(summary: portfolioController.portfolio.value!),
                        const SizedBox(height: 16),
                        AllocationChart(holdings: portfolioController.holdings),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Your Holdings',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            DropdownButton<SortType>(
                              value: portfolioController.currentSort.value,
                              underline: const SizedBox(),
                              items: const [
                                DropdownMenuItem(value: SortType.value, child: Text('Sort by Value')),
                                DropdownMenuItem(value: SortType.name, child: Text('Sort by Name')),
                                DropdownMenuItem(value: SortType.gain, child: Text('Sort by Gain')),
                              ],
                              onChanged: (type) {
                                if (type != null) portfolioController.setSortType(type);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ]),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final holding = portfolioController.holdings[index];
                          return HoldingListItem(holding: holding);
                        },
                        childCount: portfolioController.holdings.length,
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
                ],
              ),
            ),
            if (portfolioController.isLoading.value)
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(),
              ),
          ],
        );
      }),
    );
  }
}
