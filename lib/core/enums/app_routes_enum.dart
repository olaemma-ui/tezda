// ignore_for_file: constant_identifier_names

/// This is the enum for the app routes
/// [initialRoute] This is the initial route
/// [initialRouteHero] This is the initial route hero
/// [onboarding] This is the onboarding route
/// [success] This is the success route
/// [login] This is the login route
/// [register] This is the register route
/// [products] This is the products route
/// [productDetail] This is the product detail route
/// [profile] This is the profile route
/// [dashboard] This is the dashboard route
enum AppRoute {
  splash('/'),
  login('/auth/login'),
  register('/auth/register'),
  products('/products'),
  productDetail('/products/:id'),
  profile('/profile'),
  dashboard('/dashboard');

  const AppRoute(this.path);
  final String path;
}
