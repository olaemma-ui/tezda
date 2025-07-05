import 'package:tezda/core/config/environment.dart';

///[ApiUri] this class is a constant class that contains all the Uri setup
///for each enpoint and makes it much more easier
class ApiUri {
  ///[_host] This is the host of the server
  ///The current running evnvironment dev
  static final String _host = _getHost();

  static String _getHost() {
    switch (Environment.currentEnvironment ?? EnvProcess.PRODUCTION) {
      case EnvProcess.DEVELOPMENT:
        return 'dummyjson.com';
      case EnvProcess.STAGING:
        return 'dummyjson.com';
      case EnvProcess.PRODUCTION:
        return 'dummyjson.com';
    }
  }

  ///[_scheme] This defines the scheme for the api (http or https)
  static const String _scheme = 'https';

  ///[_version] This is the api version e.g v1
  // static final String _version =
  //     Environment.currentEnvironment == 'dev' ? '' : '/Development/';

  /// This is the base Uri setup for all enpoints
  static Uri _baseUri(String path, [Map<String, dynamic>? queryParameters]) =>
      Uri(
        scheme: _scheme,
        host: _host,
        path: path,
        queryParameters: queryParameters,
      );

  ///[login] This is the login endpoint
  ///METHOD: POST
  ///BODY: {email: String, password: String}  
  ///RESPONSE: {token: String}
  static Uri get login => _baseUri('/auth/login');

  ///[profile] This is the profile endpoint
  ///METHOD: GET
  ///RESPONSE: {id: String, name: String, email: String}
  static Uri get profile => _baseUri('/auth/me');

  ///[products] This is the products endpoint
  ///METHOD: GET
  ///RESPONSE: {products: List<Product>}
  static Uri get products => _baseUri('/products');

  ///[product] This is the product endpoint
  ///METHOD: GET
  ///RESPONSE: {product: Product}
  static Uri product(String id) => _baseUri('/products/$id');
}
