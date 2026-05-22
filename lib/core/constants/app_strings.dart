/// All user-facing strings for FinView Lite.
/// Use this class throughout the app — never hardcode strings in views or widgets.
abstract final class AppStrings {
  // ── App ──────────────────────────────────────────────────
  static const String appName = 'FinView Lite';
  static const String appTagline = 'Premium Investment Insights';

  // ── Login View ───────────────────────────────────────────
  static const String loginTitle = 'FinView Lite';
  static const String loginSubtitle = 'Premium Investment Insights';
  static const String loginUsernameLabel = 'Username';
  static const String loginPasswordLabel = 'Password';
  static const String loginButtonLabel = 'Secure Login';
  static const String loginDefaultUsername = 'investor1';
  static const String loginDefaultPassword = 'password';

  // ── Dashboard View ───────────────────────────────────────
  static const String dashboardTitle = 'FinView Lite';
  static const String dashboardGreeting = 'Welcome back,';
  static const String dashboardFallbackUser = 'Investor';
  static const String dashboardNoData = 'No data available.';

  // ── Tooltips / Actions ───────────────────────────────────
  static const String tooltipRefresh = 'Refresh';
  static const String tooltipToggleTheme = 'Toggle theme';
  static const String tooltipLogout = 'Logout';

  // ── Sort Dropdown ────────────────────────────────────────
  static const String sortByValue = 'Sort by Value';
  static const String sortByName = 'Sort by Name';
  static const String sortByGain = 'Sort by Gain';

  // ── Portfolio Summary Card ───────────────────────────────
  static const String summaryTotalValue = 'Total Portfolio Value';
  static const String summaryTotalGainLoss = 'Total Gain/Loss: ';

  // ── Allocation Chart ─────────────────────────────────────
  static const String chartTitle = 'Asset Allocation';

  // ── Holdings Section ─────────────────────────────────────
  static const String holdingsTitle = 'Your Holdings';

  // ── Error Widget ─────────────────────────────────────────
  static const String errorTitle = 'Oops! Something went wrong';
  static const String errorRetryButton = 'Try Again';
}
