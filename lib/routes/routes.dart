class Routes {
  // ignore: library_private_types_in_public_api
  static final _Home home = _Home();
  // ignore: library_private_types_in_public_api
  static final _Login login = _Login();
  static final _Chat chat = _Chat();
  static final _Post post = _Post();
}

class _Login extends RouteClass {
  @override
  // ignore: overridden_fields
  String module = "/auth";
  String login = '/';
  String register = "/register";
}

class _Post extends RouteClass {
  @override
  // ignore: overridden_fields
  String module = "/post";
  String feed = '/';
  String addPost = "/addpost";
}

class _Chat extends RouteClass {
  @override
  // ignore: overridden_fields
  String module = "/chat";
  String chat = '/';
  String users = "/users";
}

class _Home extends RouteClass {
  @override
  // ignore: overridden_fields
  String module = "/home";
  String home = '/';
  String products = "/products";
  String settings = '/settings';
  String chat = "/chat";
  String chatList = "/chatList";
}

abstract class RouteClass {
  String module = '/';

  String getRoute(String moduleRoute) => module + moduleRoute;

  String getModule() => '$module/';
}
