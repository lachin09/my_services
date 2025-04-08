import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  void _handleLogin(BuildContext context, String rawCode) {
    try {
      final uri = Uri.parse(rawCode);

      final inviteUrl = uri.queryParameters['url'];
      final nickname = uri.queryParameters['nickname'];

      if (inviteUrl != null && nickname != null) {
        final isValid = inviteUrl.contains("mysystem.com/invite");

        if (isValid) {
          Modular.to.navigate('/home/');
        } else {
          _showError(context, "Неверный QR-код (URL не подходит)");
        }
      } else {
        _showError(context, "QR-код не содержит нужные данные");
      }
    } catch (e) {
      _showError(context, "Не удалось обработать QR-код");
    }
  }

  void _showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Scaffold(
        appBar: AppBar(title: const Text('Вход через QR (Web)')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              final dummyCode =
                  'mysystem://invite?url=https://mysystem.com/invite?code=abc123&nickname=test_user';
              _handleLogin(context, dummyCode);
            },
            child: const Text('Войти через QR (Web Заглушка)'),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Сканируй QR-код')),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              onDetect: (capture) {
                final barcode = capture.barcodes.first;
                final code = barcode.rawValue ?? '';
                _handleLogin(context, code);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Отсканируй QR-код приглашения для входа в систему'),
          ),
        ],
      ),
    );
  }
}
