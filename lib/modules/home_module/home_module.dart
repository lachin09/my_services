import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_services/modules/home_module/pages/home_page.dart';
import 'package:my_services/modules/home_module/pages/user_page.dart';
import 'package:my_services/routes/routes.dart';

class HomeModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Routes.home.home, child: (_, args) => HomePage()),
    ChildRoute(
      Routes.home.userInfo,
      child: (_, args) {
        return UserPage();
      },
    ),
  ];
}
