import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_services/modules/services/supabase(fake)_services.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Modular.get<SupabaseService>().selectedUser;

    if (user == null) {
      return const Scaffold(body: Center(child: Text("no choosen user")));
    }

    return Scaffold(
      appBar: AppBar(title: Text(user.nickname)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ID: ${user.id}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              "name: ${user.nickname}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.chat),
                label: const Text("chat "),
                onPressed: () {
                  Modular.to.pushNamed('/chat');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
