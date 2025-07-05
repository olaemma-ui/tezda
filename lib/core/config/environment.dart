/// This class holds the current running build variant
/// It is used to determine the current running build variant of the app
class Environment {
  /// This variable holds the current running build variant
  static EnvProcess? environment;

  /// This returns the current running build variant of the app
  static EnvProcess? get currentEnvironment => environment;
}

/// This enum holds the current running build variant of the app
/// PRODUCTION: Production build
/// DEVELOPMENT: Development build
/// STAGING: Staging build
enum EnvProcess {
  PRODUCTION,
  DEVELOPMENT,
  STAGING,
}
