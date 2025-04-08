import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_services/modules/chat_module.dart/pages/chat_page.dart';
import 'package:my_services/modules/chat_module.dart/services/supabase_chat_service.dart';
import 'package:my_services/routes/routes.dart';

class ChatModule extends Module {
  final List<Bind> binds = [Bind.singleton((i) => FakeChatService())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Routes.chat.chat, child: (_, __) => const ChatPage()),
  ];
}
