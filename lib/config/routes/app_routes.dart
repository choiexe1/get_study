abstract class Routes {
  // PUBLIC ROUTES
  static const login = '/login';

  // PRIVATE ROUTES
  static const home = '/:id';

  static String goHome(int id) => '/$id';
}
