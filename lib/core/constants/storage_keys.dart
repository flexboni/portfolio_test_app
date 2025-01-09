class StorageKeys {
  // Private constructor to prevent instantiation
  StorageKeys._();

  // Auth related keys
  static const String isLoggedIn = 'is_logged_in';
  static const String currentUserId = 'user_id';
  static const String userDataPrefix = 'user_data_';
  static const String userPasswordPrefix = 'user_password_';

  // Helper methods for user-specific keys
  static String getUserDataKey(String userId) => '$userDataPrefix$userId';
  static String getUserPasswordKey(String userId) => '$userPasswordPrefix$userId';

  // Portfolio related keys (for future use)
  static const String portfolioDataPrefix = 'portfolio_data_';
  static const String lastSyncTime = 'last_sync_time';
  static const String appTheme = 'app_theme';
  static const String appLanguage = 'app_language';

  // Helper methods for portfolio-specific keys
  static String getPortfolioDataKey(String userId) => '$portfolioDataPrefix$userId';
}