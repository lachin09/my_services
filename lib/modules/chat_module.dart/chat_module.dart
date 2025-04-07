import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_services/modules/chat_module.dart/pages/chat_page.dart';
import 'package:my_services/routes/routes.dart';

class ChatModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Routes.chat.chat, child: (_, args) => ChatPage()),
  ];
}
