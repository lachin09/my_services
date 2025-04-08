import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_services/modules/auth_module/pages/auth_page.dart';

import 'package:my_services/routes/routes.dart';

class AuthModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Routes.login.login, child: (_, args) => AuthPage()),
  ];
}
