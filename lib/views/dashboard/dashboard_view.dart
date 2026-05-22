import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/portfolio_controller.dart';
import '../../controllers/theme_controller.dart';
import '../../core/constants/app_strings.dart';
import '../../core/helpers/responsive_helper.dart';
import '../../core/widgets/seamless_error_widget.dart';
import 'widgets/allocation_chart.dart';
import 'widgets/holding_list_item.dart';
import 'widgets/portfolio_summary_card.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  late PortfolioController _portfolioController;
  late AnimationController _headerAnimationController;
  late Animation<double> _headerFadeAnimation;
  late Animation<Offset> _headerSlideAnimation;

  @override
  void initState() {
    super.initState();
    _portfolioController = Get.put(PortfolioController());

    // Single AnimationController for the header text stagger
    _headerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _headerFadeAnimation = CurvedAnimation(
      parent: _headerAnimationController,
      curve: Curves.easeOut,
    );

    _headerSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.4), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _headerAnimationController,
            curve: Curves.easeOutCubic,
          ),
        );

    // Delay the entrance by 200ms so the screen first settles
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _headerAnimationController.forward();
    });
  }

  @override
  void dispose() {
    _headerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.dashboardTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _portfolioController.refreshData,
            tooltip: AppStrings.tooltipRefresh,
          ),
          Obx(
            () => IconButton(
              icon: Icon(
                themeController.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: themeController.toggleTheme,
              tooltip: AppStrings.tooltipToggleTheme,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: authController.logout,
            tooltip: AppStrings.tooltipLogout,
          ),
        ],
      ),
      body: Obx(() {
        if (_portfolioController.isLoading.value &&
            _portfolioController.portfolio.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_portfolioController.error.value != null &&
            _portfolioController.portfolio.value == null) {
          return SeamlessErrorWidget(
            failure: _portfolioController.error.value!,
            onRetry: _portfolioController.loadPortfolio,
          );
        }

        if (_portfolioController.portfolio.value == null) {
          return const Center(child: Text(AppStrings.dashboardNoData));
        }

        return Stack(
          children: [
            // Max-width centered container to prevent stretching on ultra-wide
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1400),
                child: RefreshIndicator(
                  onRefresh: _portfolioController.refreshData,
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      // ── Header greeting ──────────────────────────────────
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                        sliver: SliverToBoxAdapter(
                          child: SlideTransition(
                            position: _headerSlideAnimation,
                            child: FadeTransition(
                              opacity: _headerFadeAnimation,
                              child: Obx(
                                () => Text(
                                  '${AppStrings.dashboardGreeting} ${_portfolioController.portfolio.value?.user ?? AppStrings.dashboardFallbackUser}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SliverPadding(padding: EdgeInsets.only(top: 16)),

                      // ── Responsive top section: Summary + Chart ───────────
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        sliver: SliverToBoxAdapter(
                          child: ResponsiveHelper(
                            // ── Mobile: Summary then Chart vertically ──────
                            mobile: Column(
                              children: [
                                PortfolioSummaryCard(
                                  summary:
                                      _portfolioController.portfolio.value!,
                                ),
                                const SizedBox(height: 16),
                                AllocationChart(
                                  holdings: _portfolioController.holdings,
                                ),
                              ],
                            ),
                            // ── Tablet/Desktop: side-by-side ─────────────
                            desktop: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Summary takes 55% of space
                                  Flexible(
                                    flex: 55,
                                    child: PortfolioSummaryCard(
                                      summary:
                                          _portfolioController.portfolio.value!,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  // Chart takes 45% of space
                                  Flexible(
                                    flex: 45,
                                    child: AllocationChart(
                                      holdings: _portfolioController.holdings,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SliverPadding(padding: EdgeInsets.only(top: 28)),

                      // ── Holdings header row ────────────────────────────────
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        sliver: SliverToBoxAdapter(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.holdingsTitle,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              Obx(
                                () => DropdownButton<SortType>(
                                  value: _portfolioController.currentSort.value,
                                  underline: const SizedBox(),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  borderRadius: BorderRadius.circular(12),
                                  items: const [
                                    DropdownMenuItem(
                                      value: SortType.value,
                                      child: Text(AppStrings.sortByValue),
                                    ),
                                    DropdownMenuItem(
                                      value: SortType.name,
                                      child: Text(AppStrings.sortByName),
                                    ),
                                    DropdownMenuItem(
                                      value: SortType.gain,
                                      child: Text(AppStrings.sortByGain),
                                    ),
                                  ],
                                  onChanged: (type) {
                                    if (type != null) {
                                      _portfolioController.setSortType(type);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SliverPadding(padding: EdgeInsets.only(top: 12)),

                      // ── Holdings: Grid on tablet/desktop, List on mobile ──
                      SliverToBoxAdapter(
                        // padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final width = MediaQuery.of(context).size.width;
                            print(width);
                            // Desktop: 3 columns, Tablet: 2 columns, Mobile: 1 column list
                            if (width >= 884) {
                              return _buildHoldingsGrid(crossAxisCount: 3);
                            } else if (width >= 600) {
                              return _buildHoldingsGrid(crossAxisCount: 2);
                            } else {
                              return _buildHoldingsList();
                            }
                          },
                        ),
                      ),

                      const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
                    ],
                  ),
                ),
              ),
            ),

            // ── Refresh overlay progress bar ─────────────────────────────
            if (_portfolioController.isLoading.value)
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

  // Change these to return standard Box widgets
  Widget _buildHoldingsList() {
    return ListView.builder(
      shrinkWrap: true, // Required when inside a parent scrollable
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _portfolioController.holdings.length,
      itemBuilder: (context, index) {
        final holding = _portfolioController.holdings[index];
        return HoldingListItem(holding: holding, index: index);
      },
    );
  }

  Widget _buildHoldingsGrid({required int crossAxisCount}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 2.8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 4,
      ),
      itemCount: _portfolioController.holdings.length,
      itemBuilder: (context, index) {
        final holding = _portfolioController.holdings[index];
        return HoldingListItem(holding: holding, index: index);
      },
    );
  }
}
