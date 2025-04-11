import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_services/modules/home_module/models/user_model.dart';
import 'package:my_services/modules/home_module/widgets/drawer.dart';
import 'package:my_services/modules/services/supabase(fake)_services.dart';
import 'package:my_services/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      UserInfo(id: '1', nickname: 'user1'),
      UserInfo(id: '2', nickname: 'user2'),
      UserInfo(id: '3', nickname: 'user3'),
    ];

    return Scaffold(
      drawer: drawer,
      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       ListTile(
      //         onTap: () {
      //           Modular.to.pushNamed(
      //             Routes.home.getRoute(Routes.home.settings),
      //           );
      //         },
      //         title: Text(' S E T T I N G S'),
      //         trailing: Icon(Icons.chevron_right),
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(title: const Text('M Y   S E R V I C E')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.nickname),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              final service = Modular.get<SupabaseService>();
              service.setSelectedUser(user);
              Modular.to.pushNamed(Routes.home.getRoute(Routes.home.userInfo));
            },
          );
        },
      ),
    );
  }
}
