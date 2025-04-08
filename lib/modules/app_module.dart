import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_services/modules/auth_module/auth_module.dart';
import 'package:my_services/modules/chat_module.dart/chat_module.dart';
import 'package:my_services/modules/home_module/home_module.dart';
import 'package:my_services/modules/services/supabase(fake)_services.dart';
import 'package:my_services/routes/routes.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => SupabaseService())];
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Routes.home.module, module: HomeModule()),
    ModuleRoute(Routes.chat.module, module: ChatModule()),
    ModuleRoute(Routes.login.module, module: AuthModule()),
  ];
}
