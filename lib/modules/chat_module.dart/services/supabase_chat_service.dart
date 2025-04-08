import 'dart:async';

import 'package:my_services/modules/chat_module.dart/models/message_model.dart';

class FakeChatService {
  final _controller = StreamController<List<ChatMessage>>.broadcast();
  final List<ChatMessage> _messages = [];

  Stream<List<ChatMessage>> getMessages() => _controller.stream;

  void sendMessage(String text, {bool isMe = true}) {
    final message = ChatMessage(
      text: text,
      isMe: isMe,
      timestamp: DateTime.now(),
    );
    _messages.add(message);
    _controller.add(List.from(_messages));
  }

  void dispose() {
    _controller.close();
  }
}
